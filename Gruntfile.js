module.exports = function(grunt) {

  grunt.initConfig({
    coffee: {
      dist: {
        expand: true,
        cwd: 'src/js',
        src: ['**/*.coffee'],
        dest: '.tmp/js',
        ext: '.js'
      }
    },
    copy: {
      dist: {
        files: [{
          expand: true,
          cwd: 'src',
          src: ['**/*.{jpg,ico,eot,svg,ttf,woff}'],
          dest: 'dist'
        }]
      }
    },
    uglify: {
      options: {
        banner: '/*! Built with Grunt */\n',
        mangle: false,
        compress: false,
        beautify: true
      },
      dist: {
        files: [{
          expand: true,
          cwd: '.tmp/js',
          src: ['*.js'],
          dest: 'dist/js',
          ext: '.js'
        }, {
          src: 'bower_components/instantclick/instantclick.js',
          dest: 'dist/js/instantclick.js'
        }]
      }
    },
    less: {
      dist: {
        options: {
          yuicompress: true,
          concat: false
        },
        files: [{
          expand: true,
          cwd: 'src/css',
          src: ['style.less'],
          dest: 'dist/css',
          ext: '.css'
        }]
      }
    },
    htmlmin: {
      dist: {
        options: {
          removeComments: true,
          collapseWhitespace: true
        },
        files: [{
          expand: true,
          cwd: 'src',
          src: ['**/*.html'],
          dest: 'dist/pages',
          ext: '.html'
        }]
      }
    },
    imagemin: {
      dist: {
        options: {
          removeComments: true,
          optimizationLevel: 1
        },
        files: [{
          expand: true,
          cwd: 'src',
          src: ['**/*.{png,gif}'],
          dest: 'dist',
        }]
      }
    },
    concurrent: {
      options: {
        limit: 5,
      },
      build: ['coffee', 'less', 'imagemin', 'htmlmin', 'copy'],
      postbuild: ['uglify'],
      watch: ['watch:coffee', 'watch:less', 'watch:html', 'php']
    },
    clean: {
      pre: ['dist/css', 'dist/img', 'dist/js', 'dist/pages'],
      post: ['.tmp']
    },
    watch: {
      coffee: {
        files: ['src/js/*.coffee'],
        tasks: ['coffee', 'uglify']
      },
      less: {
        files: ['src/css/*.less'],
        tasks: ['less']
      },
      html: {
        files: ['src/*.html'],
        tasks: ['htmlmin']
      },
    },
    php: {
      spy: {
        options: {
          base: 'dist',
          open: true,
          keepalive: true,
          router: 'router.php',
          hostname: '0.0.0.0',
          port: 3000,
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-concurrent');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-htmlmin');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-php');

  grunt.registerTask('default', ['clean:pre', 'concurrent:build', 'concurrent:postbuild', 'clean:post']);
  grunt.registerTask('spy', ['clean:pre', 'concurrent:build', 'concurrent:postbuild', 'clean:post', 'concurrent:watch']);

};
