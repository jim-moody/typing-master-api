'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Exercises = models.exercise

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Exercises.find()
    .populate({
      path: 'scores._owner',
      select: 'email'
    })
    .then(exercises => res.json({
      exercises: exercises.map((e, i) =>
        e.toJSON({ virtuals: true, user: req.user, index: i }))
    }))
    .catch(next)
}

const show = (req, res, next) => {
  const id = req.params.id
  Exercises.findOne({_id: id})
    .populate({
      path: 'scores._owner',
      select: 'email'
    })
    .then(response =>
      res.json({ exercise: response.toJSON({ virtuals: true, user: req.user }) })
    )
  .catch(next)
}

const create = (req, res, next) => {
  delete req.body.version // disallow version setting
  const exercise = Object.assign(req.body.exercise, {
    _owner: req.user._id
  })
  Exercises.findOne({name: req.body.exercise.name})
    .then(response => {
      if (response) {
        const error = {
          status: 400,
          error: {
            message: 'Duplicate Name',
            type: 'duplicate'
          }
        }
        throw error
      }
    })
    .then(() => Exercises.create(exercise))
    .then(exercise =>
      res.status(201)
        .json({
          exercise: exercise.toJSON({ virtuals: true, user: req.user })
        }))
    .catch(error => {
      if (error.status) {
        res.status(400).send(error.error)
      } else {
        next(error)
      }
    })
}

const update = (req, res, next) => {
  delete req.body._owner  // disallow owner reassignment.
  Exercises.findOne({name: req.body.exercise.name})
    .then(response => {
      if (response && response.id !== req.params.id) {
        const error = {
          status: 400,
          error: {
            message: 'Duplicate Name',
            type: 'duplicate'
          }
        }
        throw error
      }
    })
    .then(() => req.exercise.update(req.body.exercise))
    .then(() => res.sendStatus(204))
    .catch(error => {
      if (error.status) {
        res.status(400).send(error.error)
      } else {
        next(error)
      }
    })
}

const destroy = (req, res, next) => {
  req.exercise.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Exercises, { forUser: true }), only: ['update', 'destroy'] }
] })
