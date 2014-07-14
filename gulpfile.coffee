# Load all required libraries.
gulp = require "gulp"
jade = require "gulp-jade"
less = require "gulp-less"
uglify = require "gulp-uglify"
concat = require "gulp-concat"
coffee = require "gulp-coffee"
watch = require "gulp-watch"
plumber = require "gulp-plumber"
templateCache = require "gulp-angular-templatecache"
livereload = require "gulp-livereload"
wait = require "gulp-wait"

# Paths to production files in project and respective destinations
filePath =
  root: "./"
  public: "./_public/**/*.*"
  coffee_controllers: { src: "./src/**/*.controller.coffee", dest: "./_public/js" }
  coffee_services: { src: "./src/**/*.service.coffee", dest: "./_public/js" }
  coffee_custom: { src: "./src/custom.coffee", dest: "./_public/js" }
  jade_index: { src: "./src/index.jade", dest: "./_public" }
  jade_templates: { src: [ "./src/**/*.jade", "!./src/index.jade" ], dest: "./_public/js" }
  less_custom: { src: "./src/custom.less", dest: "./_public/css" }
  assets: { src: "./assets/**/*.*", dest: "./_public/assets" }
  angular: { src: "./bower_components/angular/angular.js", dest: "./_public/js" }
  angular_route: { src: "./bower_components/angular-route/angular-route.js", dest: "./_public/js" }
  angular_resource: { src: "./bower_components/angular-resource/angular-resource.js", dest: "./_public/js" }
  angular_bootstrap: { src: "./bower_components/angular-bootstrap/ui-bootstrap-tpls.js", dest: "./_public/js" }
  less_bootstrap: { src: "./bower_components/bootstrap/less/bootstrap.less", dest: "./_public/css" }
  jquery: { src: "./bower_components/jquery/dist/jquery.js", dest: "./_public/js" }

# Create JS from CS
gulp.task "coffee", () ->
  gulp.src filePath.coffee_controllers.src
    .pipe concat("app.js")
      .pipe coffee()
        .pipe gulp.dest filePath.coffee_controllers.dest
  gulp.src filePath.coffee_services.src
    .pipe concat("services.js")
      .pipe coffee()
        .pipe gulp.dest filePath.coffee_services.dest
  gulp.src filePath.coffee_custom.src
    .pipe concat("custom.js")
      .pipe coffee()
        .pipe gulp.dest filePath.coffee_custom.dest

# Create HTML from Jade (index separate)
gulp.task "index", () ->
  gulp.src filePath.jade_index.src
    .pipe jade({ pretty: true })
      .pipe gulp.dest filePath.jade_index.dest

# Create template cache
gulp.task "templates", () ->
  gulp.src filePath.jade_templates.src
    .pipe jade({ pretty: true })
      .pipe templateCache({ module: "app" })
        .pipe gulp.dest filePath.jade_templates.dest

# Copy Twitter Bootstrap
gulp.task "less", () ->
  gulp.src filePath.less_bootstrap.src
    .pipe less()
      .pipe gulp.dest filePath.less_bootstrap.dest
  gulp.src filePath.less_custom.src
    .pipe less()
      .pipe gulp.dest filePath.less_custom.dest

# Copy all assets (images, pdfs, fonts)
gulp.task "assets", () ->
  gulp.src filePath.assets.src
    .pipe gulp.dest filePath.assets.dest

# Copy Angular and Angular-route
gulp.task "angular", () ->
  gulp.src filePath.angular.src
    .pipe gulp.dest filePath.angular.dest
  gulp.src filePath.angular_route.src
    .pipe gulp.dest filePath.angular_route.dest
  gulp.src filePath.angular_resource.src
    .pipe gulp.dest filePath.angular_resource.dest
  gulp.src filePath.angular_bootstrap.src
    .pipe gulp.dest filePath.angular_bootstrap.dest
  gulp.src filePath.jquery.src
    .pipe gulp.dest filePath.jquery.dest

# Watch for change and re-execute respective gulp tasks
gulp.task "watch", () ->
  watch({ glob: [ filePath.coffee_controllers.src, filePath.coffee_services.src, filePath.coffee_custom.src ] }, () ->
    gulp.start "coffee"
  )
  watch({ glob: filePath.jade_index.src }, () ->
    gulp.start "index"
  )
  watch({ glob: filePath.jade_templates.src }, () ->
    gulp.start "templates"
  )
  watch({ glob: filePath.less_custom.src }, () ->
    gulp.start "less"
  )
  watch({ glob: filePath.assets.src }, () ->
    gulp.start "assets"
  )
  watch({ glob: filePath.assets.src }, () ->
    gulp.start "assets"
  )

# Enable livereload
gulp.task "livereload", [ "coffee", "index", "templates", "less", "assets", "angular" ], () ->
  livereload.listen()
  watch({ glob: filePath.public }, () ->
    livereload.changed()
  )

# Default tasks
gulp.task "default", ["coffee", "index", "templates", "less", "assets", "angular", "watch", "livereload"]