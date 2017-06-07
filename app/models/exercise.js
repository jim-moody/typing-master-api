'use strict'

const Score = require('./score')
const mongoose = require('mongoose')

const exerciseSchema = new mongoose.Schema({
  text: {
    type: String,
    required: true,
    maxlength: 750
  },
  name: {
    type: String,
    required: true
  },
  scores: [Score.ScoreSchema],
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
})

const Exercise = mongoose.model('Exercise', exerciseSchema)

module.exports = Exercise
