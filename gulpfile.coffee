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
  less: { src: './src/custom.less', dest: './_public/css' }
  assets: { src: './assets/*.*', dest: './_public/assets' }
  coffee: { src: './src/**/*.controller.coffee', dest: './_public/js' }
  angular: { src: './bower_components/angular/angular.js', dest: './_public/js' }
  angular_route: { src: './bower_components/angular-route/angular-route.js', dest: './_public/js' }
  jquery: { src: './bower_components/jquery/dist/jquery.js', dest: './_public/js' }
  js: { src: './src/custom.coffee', dest: './_public/js' }
  fonts: { src: './src/fonts/*.*', dest: './_public/fonts' }

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
gulp.task 'less', () ->
  gulp.src filePath.bootstrap.src
    .pipe less()
    .pipe gulp.dest filePath.bootstrap.dest
  gulp.src filePath.less.src
    .pipe less()
    .pipe gulp.dest filePath.less.dest

gulp.task 'assets', () ->
  gulp.src filePath.assets.src
    .pipe gulp.dest filePath.assets.dest

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
  gulp.src filePath.jquery.src
    .pipe gulp.dest filePath.jquery.dest
  gulp.src filePath.js.src
    .pipe coffee()
    .pipe gulp.dest filePath.js.dest

gulp.task 'fonts', () ->
  gulp.src filePath.fonts.src
    .pipe gulp.dest filePath.fonts.dest

# Watch for change and re-execute respective gulp tasks
gulp.task 'watch', () ->
  watch({ glob: filePath.index.src }, () ->
    gulp.start 'jade'
  )
  watch({ glob: filePath.less.src }, () ->
    gulp.start 'less'
  )
  watch({ glob: filePath.templates.src }, () ->
    gulp.start 'templates'
    gulp.start 'jade'
  )
  watch({ glob: filePath.assets.src }, () ->
    gulp.start 'assets'
  )
  watch({ glob: filePath.coffee.src }, () ->
    gulp.start 'coffee'
  )
  watch({ glob: filePath.js.src }, () ->
    gulp.start 'angular'
  )

# Default tasks
gulp.task 'default', ['jade', 'templates', 'less', 'assets', 'coffee', 'angular', 'fonts', 'watch']