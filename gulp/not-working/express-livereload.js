import gulp from 'gulp';

import gulpLoadPlugins from 'gulp-load-plugins';
const $ = gulpLoadPlugins();

import configs from '../config';
const config = configs.express;

import nodemon from 'gulp-nodemon';
import livereload from 'gulp-livereload';

gulp.task('serve', function() {
  livereload.listen();
  let reloaded = void 0;

  nodemon({
    script: './bin/www',
    ext: 'js',
    ignore: ['bower_components', 'gulp', 'node_modules', 'public', 'vendor', 'source'],
    watch: [
      "routes/"
    ],
    env: {
      'NODE_ENV': 'development',
      'DEBUG': 'express-browserSync-boilerplate'
    },
    stdout: false // Express の再起動時のログを監視するため
  }).on('readable', function() {
    this.stdout.on('data', function(chunk) {
      if (/^Express\ server\ listening/.test(chunk)) {
        livereload.reload();
      }

      process.stdout.write(chunk);
    });
    this.stderr.on('data', function(chunk) {
      process.stderr.write(chunk);
    });
  });

  gulp
    .watch([config.css, config.js])
    .on('change', function(event) {
      livereload.changed(event);
    });
});
