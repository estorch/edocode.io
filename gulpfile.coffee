# Load all required libraries.
gulp = require 'gulp'
jade = require 'gulp-jade'
less = require 'gulp-less'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
templateCache = require 'gulp-angular-templatecache'

# Paths to production files in project and respective destinations
filePath =
  root: './'
  index: { src: './src/index.jade', dest: './_public' }
  templates: { src: [ './src/**/*.jade', '!./src/index.jade' ], dest: './_public' }
  bootstrap: { src: './bower_components/bootstrap/less/bootstrap.less', dest: './_public/css' }
  coffee: { src: './src/**/*.controller.coffee', dest: './_public/js' }
  angular: { src: './bower_components/angular/angular.js', dest: './_public/js' }
  angular_route: { src: './bower_components/angular-route/angular-route.js', dest: './_public/js' }

# Create HTML from Jade (index separate)
gulp.task 'jade', () ->
  gulp.src filePath.index.src
    .pipe jade({ pretty: true })
    .pipe gulp.dest filePath.index.dest
  gulp.src filePath.templates.src
    .pipe jade({ pretty: true })
    .pipe gulp.dest filePath.templates.dest

# Create template cache (template not used yet)
gulp.task 'templates', () ->
  gulp.src filePath.templates.src
    .pipe jade({ pretty: true })
    .pipe templateCache()
    .pipe gulp.dest filePath.templates.dest

# Copy Twitter Bootstrap
gulp.task 'bootstrap', () ->
  gulp.src filePath.bootstrap.src
    .pipe less()
    .pipe gulp.dest filePath.bootstrap.dest

# Create JS from CS
gulp.task 'coffee', () ->
  gulp.src filePath.coffee.src
    .pipe concat('app.js')
    .pipe coffee()
    .pipe gulp.dest filePath.coffee.dest

# Copy Angular and Angular-route
gulp.task 'angular', () ->
  gulp.src filePath.angular.src
    .pipe gulp.dest filePath.angular.dest
  gulp.src filePath.angular_route.src
    .pipe gulp.dest filePath.angular_route.dest

# Watch for change and re-execute respective gulp tasks
gulp.task 'watch', () ->
  watch({ glob: filePath.index.src }, () ->
    gulp.start 'jade'
  )
  watch({ glob: filePath.templates.src }, () ->
    gulp.start 'templates'
  )
  watch({ glob: filePath.coffee.src }, () ->
    gulp.start 'coffee'
  )

# Default tasks
gulp.task 'default', ['jade', 'templates', 'bootstrap', 'coffee', 'angular', 'watch']