gulp = require 'gulp'
$ = require('gulp-load-plugins')()

config = require('config').express

server = require 'gulp-express'

# start the server at the beginning of the task
gulp.task 'server', ->
  server.run
    file: './app.js'

gulp.task 'watch-express', ->
  gulp.watch [config.css, config.js, config.source], [server.run]

gulp.task 'default', ['server', 'watch-express']