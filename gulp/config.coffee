module.exports = {
  browserify: [
    {
      input: ['./source/javascripts/okamisan.js']
      output: 'okamisan.js'
      extensions: ['.js']
      destination: './public/javascripts/'
    }
    {
      input: ['./source/javascripts/ojisan.js']
      output: 'ojisan.js'
      extensions: ['.js']
      destination: './public/javascripts/'
    }
  ]
  jsLibConcat:
    name: 'lib.js'
    srcs: [
      './bower_components/PreloadJS/lib/preloadjs-0.6.1.combined.js'
      './bower_components/TweenJS/lib/tweenjs-0.6.1.combined.js'
      './bower_components/SoundJS/lib/soundjs-0.6.1.min.js'
      './bower_components/EaselJS/lib/easeljs-0.7.1.min.js'
      './source/javascripts/lib/particleEmitterJs-0.5.0.js'
      './bower_components/pixi.js/bin/pixi.min.js'
      './bower_components/pixi-particles/dist/pixi-particles.js'
      './source/javascripts/lib/stats.min.js'
      './bower_components/eventemitter2/lib/eventemitter2.js'
      './bower_components/jquery/dist/jquery.js'
      './bower_components/velocity/velocity.js'
      './bower_components/lodash/lodash.js'
      './bower_components/react/react.js'
    ]
    dest: './public/javascripts/'
  watch:
    sass: './source/stylesheets/**/*.scss'
    css: './source/stylesheets/**/*.css'
  express:
    js: './public/stylesheets/**/*.css'
    css: './public/javascripts/**/*.js'
    source: './routes/**/*.js'
  compass:
    design: {
      src: './source/stylesheets/style.scss'
      css: 'source/stylesheets'
      sass: 'source/stylesheets'
    }
    development: {
      src: './source/stylesheets/development.scss'
      css: 'source/stylesheets'
      sass: 'source/stylesheets'
    }
  cssConcat:
    name: 'all.css'
    srcs: [
      './source/stylesheets/normalize.css'
      './source/stylesheets/style.css'
      './source/stylesheets/development.css'
    ]
    dest: './public/stylesheets/'
}

