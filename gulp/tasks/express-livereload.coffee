gulp = require 'gulp'
$ = require('gulp-load-plugins')()
config = require('../config').express

nodemon = require('gulp-nodemon')
livereload = require('gulp-livereload')

# not working https://github.com/gimm/gulp-live-server
# not working https://github.com/intesso/connect-livereload

# fixed http://mid0111.hatenablog.com/entry/2014/10/19/142817

gulp.task 'serve', ->
  livereload.listen()
  reloaded = undefined

  nodemon(
    script: './bin/www'
    ext: 'js'
    ignore: [
      'bower_components'
      'gulp'
      'node_modules'
      'public'
      'vendor'
      'source'
    ]
    env:
      'NODE_ENV': 'development'
      'DEBUG': 'izakaya-project'
    stdout: false
  ).on 'readable', ->
    # 標準出力に起動完了のログが出力されたらリロードイベント発行
    @stdout.on 'data', (chunk) ->
      if /^Express\ server\ listening/.test(chunk)
        livereload.reload()
      process.stdout.write chunk

  # node を再起動する必要のないファイル群用の設定
  gulp.watch([
    config.css
    config.js
  ]).on 'change', (event) ->
    livereload.changed event
