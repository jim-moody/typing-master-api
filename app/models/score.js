'use strict'

const mongoose = require('mongoose')

const scoreSchema = new mongoose.Schema({
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  mistakes: {
    type: Number,
    required: true
  },
  time: {
    type: Number,
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

scoreSchema.virtual('wpm').get(function length () {
  const parent = this.parent()
  return Math.round((parent.text.length / 5) / (this.time * 60))
})
scoreSchema.virtual('accuracy').get(function length () {
  const total = this.parent().text.length
  return total / (total - this.mistakes)
})

const Score = mongoose.model('Score', scoreSchema)

module.exports.default = Score
module.exports.ScoreSchema = scoreSchema
