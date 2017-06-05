'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Exercises = models.exercise
const HttpError = require('lib/wiring/errors/http-error')

// const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

// const index = (req, res, next) => {
//   Exercises.find()
//     .then(exercises => res.json({
//       exercises: exercises.map((e) =>
//         e.toJSON({ virtuals: true, user: req.user }))
//     }))
//     .catch(next)
// }
//
// const show = (req, res) => {
//   res.json({
//     exercise: req.exercise.toJSON({ virtuals: true, user: req.user })
//   })
// }

const create = (req, res, next) => {
  const score = Object.assign(req.body.score, {
    _owner: req.user._id
  })
  req.exercise.scores.push(score)
  req.exercise.save()
    .then(exercise =>
      res.status(201)
        .json({
          exercise: exercise.toJSON({ virtuals: true, user: req.user })
        }))
    .catch(next)
}

const update = (req, res, next) => {
  // disallow owner reassignment
  delete req.body._owner
  // find a score owned by this user on this exercise
  const index = req.exercise.scores.findIndex(score =>
    score._owner.equals(req.user._id) && score.id === req.params.score_id
  )
  const error = index === -1 && new HttpError(404)
  if (error) {
    return next(error)
  }
  // create new score object with fields from old/new and save it
  const newScore = Object.assign(req.exercise.scores[index], req.body.score)
  req.exercise.scores[index] = newScore
  req.exercise.save()
    .then(() => res.sendStatus(204))
    .catch(next)
}

const destroy = (req, res, next) => {
  const index = req.exercise.scores.findIndex(score =>
    score._owner.equals(req.user._id) && score.id === req.params.score_id
  )
  const error = index === -1 && new HttpError(404)
  if (error) {
    return next(error)
  }
  req.exercise.scores.splice(index, 1)
  req.exercise.save()
    .then(() => res.sendStatus(204))
    .catch(next)
}

module.exports = controller({
  // index,
  // show,
  create,
  update,
  destroy
}, { before: [
  { method: setUser },
  // { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Exercises) }
] })
