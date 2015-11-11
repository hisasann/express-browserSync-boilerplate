gulp = require 'gulp'
$ = require('gulp-load-plugins')()
gls = require('gulp-live-server')

config = require('config').express

gulp.task 'serve', ->
  #1. run your script as a server
#  server = gls.new('./bin/www')
  server = gls('./bin/www', undefined, true)
  server.start()

  #2. run script with cwd args, e.g. the harmony flag
#  server = gls.new([
#    '--harmony'
#    'myapp.js'
#  ])

  #this will achieve `node --harmony myapp.js`
  #you can access cwd args in `myapp.js` via `process.argv`
#  server.start()

  #use gulp.watch to trigger server actions(notify, start or stop)
  gulp.watch [
    config.css
    config.js
    config.source
  ], (file) ->
    console.log('watch');
#    server.start.bind(server)
    server.notify.apply server, [ file ]
    return

  #restart my server
  gulp.watch './bin/www', server.start.bind(server)

  return
