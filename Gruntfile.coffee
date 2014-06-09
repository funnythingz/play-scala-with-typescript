module.exports = (grunt)->

  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-typescript')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', ['clean', 'typescript', 'uglify', 'copy', 'compass'])

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    typescript:
      base:
        src: ['resources/ts/**/*.ts']
        dest: 'public/js/app.js'
        options:
          sourceMap: true

      test:
        src: ['test_ts/**/*.ts']
        dest: 'test_ts/test.js'
        options:
          sourceMap: true

    uglify:
      dist:
        files: 'public/js/app.min.js': ['public/js/app.js']

    copy:
      assets:
        files: [{
          expand: true
          cwd: 'assets/imgs/'
          src: ['**/*.png', '**/*.gif', '**/*.jpg']
          dest: 'public/imgs/'
        }]

      jquery:
        files: [{
          expand: true
          cwd: 'bower_components/jquery/dist/'
          src: ['jquery.min.js']
          dest: 'public/js/'
        }]

      fastclick:
        files: [{
          expand: true
          cwd: 'bower_components/fastclick/lib/'
          src: ['fastclick.js']
          dest: 'public/js/'
        }]

    compass:
      dist:
        options:
          config: 'config.rb'

    watch:
      typescript:
        files: ['resources/ts/**/*.ts', 'test_ts/**/*.ts']
        tasks: ['clean', 'typescript', 'uglify', 'copy', 'compass']
        options:
          atBegin: true

      css:
        files: ['resources/scss/**/*.scss']
        tasks: ['compass']
        options:
          atBegin: true

    clean: ['public/js/app.js', 'public/js/app.min.js']

  })
