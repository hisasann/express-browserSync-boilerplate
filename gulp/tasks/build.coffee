gulp = require 'gulp'
$ = require('gulp-load-plugins')()
runSequence = require 'run-sequence'

gulp.task 'local', ->
  global.isWatching = true
  global.isRelease = false

  gulp.src './source/javascripts/env/local/env.js'
  .pipe gulp.dest('./source/javascripts/env/')

  runSequence 'js-lib-concat', 'browserify', 'compass', 'css-concat', 'watch', 'serve'

gulp.task 'product', ->
  global.isWatching = false
  global.isRelease = true

  gulp.src './source/javascripts/env/product/env.js'
  .pipe gulp.dest('./source/javascripts/env/')

  runSequence 'js-lib-concat', 'browserify', 'compass', 'css-concat'