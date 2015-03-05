axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
contentful   = require 'roots-contentful'
slug         = require 'slug'
jeet         = require 'jeet'
browserify   = require 'roots-browserify'
#ClientTemplates = require 'client-templates'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), rupture(), autoprefixer(), jeet()]

  jade:
    pretty: true

  server:
    clean_urls: true

  extensions: [
    browserify
      external: 'assets/js/MooTools-Core-1.5.1.js'
      files: 'assets/js/main.coffee'
      out: 'js/build.js'
    contentful
      access_token: 'eb2f7ed24d0f0dfc16e1a13f475447746150bd843aacae73ff48ae812b0b1992'
      space_id: '02l6hl9fkby0'
      content_types: [
        {
          id: 'TIXX1GyfeMSGWUikyGmkC'
          name: 'project'
          template: 'views/_project.jade'
          path: (e) -> "projects/#{slug(e.categorie.fields.nom)}/#{slug(e.titre)}"
        }
      ]
  ]
