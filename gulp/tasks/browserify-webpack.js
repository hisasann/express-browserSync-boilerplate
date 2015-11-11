"use strict";

import gulp from 'gulp';

import gulpLoadPlugins from 'gulp-load-plugins';
const $ = gulpLoadPlugins();

import configs from '../config';
const config = configs.browserify;

//var browserSync = require('browser-sync');
import plumber from 'gulp-plumber';
import notify from 'gulp-notify';

// javascripts
//var browserify = require('browserify');
import webpack from 'gulp-webpack';
import named from 'vinyl-named';
//var babelify = require('babelify');
import source from 'vinyl-source-stream';
//var uglify = require('gulp-uglify');
import buffer from 'vinyl-buffer';

gulp.task('browserify-webpack', function(){
  // エラーメッセージ
  var errorMsg = function() {
    let args = Array.prototype.slice.call(arguments);
    // Send error to notification center with gulp-notify
    notify.onError({
      title: "Compile Error",
      message: "<%= error %>"
    }).apply(this, args);
    // Keep gulp from hanging on this task
    this.emit('end');
  };

  return gulp.src(config.input)
    .pipe(named())
    .pipe(webpack({
      module: {
        loaders: [
          {
            test: /\.(js|jsx)$/,
            exclude: /(node_modules|bower_components)/,
            loader: "babel-loader",
            query: {
              presets: ['es2015', 'stage-3', 'react'],
              plugins: ['syntax-async-functions']
            }
          }
        ]
      }
    }))
    //.transform(babelify)
    //.bundle()
    .on('error', errorMsg)
    .pipe(plumber())
    .pipe(buffer())
    // .pipe(jshint())
    //.pipe(uglify({preserveComments:'some'})) // minify＆ライセンスコメント残す
    .pipe(gulp.dest(config.output));
    //.pipe(browserSync.reload({stream: true}));
});
