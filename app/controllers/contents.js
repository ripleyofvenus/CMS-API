'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Content = models.content
const User = models.user

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Content.find()
    .then(contents => res.json({
      contents: contents.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const findByOwnerEmail = (req, res, next) => {
  User.findOne({ email: req.params.email })
    .then(user => {
      user = user.toObject()
      Content.find({ _owner: user.id })
        .then(contents => res.json({
          contents: contents.map((content) =>
            content.toJSON({ virtuals: true, user: req.user }))
        }))
    })
    .catch(next)
}

const show = (req, res) => {
  res.json({
    content: req.content.toJSON({ virtuals: true, user: req.user })
  })
}

const create = (req, res, next) => {
  const content = Object.assign(req.body.content, {
    _owner: req.user._id
  })
  Content.create(content)
    .then(content =>
      res.status(201)
        .json({
          content: content.toJSON({ virtuals: true, user: req.user })
        }))
    .catch(next)
}

const update = (req, res, next) => {
  delete req.body._owner  // disallow owner reassignment.
  req.content.update(req.body.content)
    .then(() => res.sendStatus(204))
    .catch(next)
}

const destroy = (req, res, next) => {
  req.content.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy,
  findByOwnerEmail
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show', 'findByOwnerEmail'] },
  { method: setModel(Content), only: ['show'] },
  { method: setModel(Content, { forUser: true }), only: ['update', 'destroy'] }
] })
