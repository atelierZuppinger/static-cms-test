axis             = require 'axis'
rupture          = require 'rupture'
autoprefixer     = require 'autoprefixer-stylus'
contentful       = require 'roots-contentful'
slug             = require 'slug'
jeet             = require 'jeet'
browserify       = require 'roots-browserify'
browserifyShim   = require 'browserify-shim'
coffeeify        = require 'coffeeify'

#ClientTemplates = require 'client-templates'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), rupture(), autoprefixer(), jeet()]

  jade:
    pretty: true

  locals:
    slug: slug

  server:
    clean_urls: true

  extensions: [
    browserify
      files: 'assets/js/main.coffee'
      out: 'js/build.js'
      transforms: [browserifyShim, coffeeify]
    contentful
      access_token: '45565d5aeb936c032b79022363f299398c15f031f43f398aa1665e4c1b417ecf'
      space_id: 'icf42ioqrb6x'
      content_types: [
        {
          id: '7leLzv8hW06amGmke86y8G'
          name: 'photoGallery'
          template: 'views/_galerie.jade'
          path: (e) -> "galeries/#{e.slug}"
        }
      ]
  ]
