# Load all required libraries.
gulp = require 'gulp'
jade = require 'gulp-jade'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'

filePath =
  root: './'
  jade: { src: './app/index.jade', dest: './_public' }
  coffee: { src: './app/**/*.controller.coffee', dest: './_public/js' }
  js: { src: './bower_components/angular/angular.js', dest: './_public/js' }

# Create HTML from Jade
gulp.task 'jade', () ->
  gulp.src filePath.jade.src
    .pipe jade({pretty: true})
    .pipe gulp.dest filePath.jade.dest

gulp.task 'coffee', () ->
  gulp.src filePath.coffee.src
    .pipe concat('app.js')
    .pipe coffee()
    .pipe gulp.dest filePath.coffee.dest

gulp.task 'js', () ->
  gulp.src filePath.js.src
    .pipe gulp.dest filePath.js.dest

gulp.task 'watch', () ->
  watch({ glob: filePath.jade.src }, () ->
    gulp.start 'jade'
  )
  watch({ glob: filePath.coffee.src }, () ->
    gulp.start 'coffee'
  )
  watch({ glob: filePath.js.src }, () ->
    gulp.start 'js'
  )

# Default tasks
gulp.task 'default', ['jade', 'coffee', 'js', 'watch']