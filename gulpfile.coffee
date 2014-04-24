# Load all required libraries.
gulp = require 'gulp'
jade = require 'gulp-jade'

# Create HTML from Jade
gulp.task 'html', ->
  gulp.src 'app/index.jade'
    .pipe jade()
    .pipe gulp.dest '_public'

# Default tasks
gulp.task 'default', ['html']