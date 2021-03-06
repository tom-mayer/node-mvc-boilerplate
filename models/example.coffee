mongoose = require('mongoose')
Schema = mongoose.Schema

threadSchema = new Schema
  title:  String,
  postdate:
    type: Date,
    default: Date.now
  author:
    type: String,
    default: 'Anon'

module.exports = mongoose.model('Thread', threadSchema)