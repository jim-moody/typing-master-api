'use strict'

module.exports = require('lib/wiring/routes')

// create routes

// what to run for `GET /`
.root('root#root')

// standards RESTful routes
.resources('examples')

// users of the app have special requirements
.post('/sign-up', 'users#signup')
.post('/sign-in', 'users#signin')
.delete('/sign-out/:id', 'users#signout')
.patch('/change-password/:id', 'users#changepw')
.resources('users', { only: ['index', 'show'] })
.resources('exercises')

// scores
.post('/exercises/:id/scores', 'scores#create')
.patch('/exercises/:id/scores/:score_id', 'scores#update')
.delete('/exercises/:id/scores/:score_id', 'scores#destroy')
// .get('/exercises/:id/scores/:score_id', 'scores#show')

// all routes created
