axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
contentful   = require 'roots-contentful'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  extensions: [
    contentful
      access_token: 'eb2f7ed24d0f0dfc16e1a13f475447746150bd843aacae73ff48ae812b0b1992'
      space_id: '02l6hl9fkby0'
      content_types: [
        # {
        #   id: 'xxxx'                    # ID of your content type
        #   name: 'posts'                 # data will be made available through this key on the `contentful` object in your templates
        #   filters: {}                   # passes filters to the call to contentful's API, see contentful's docs for more info
        #   template: 'path/to/template'  # if present a single page view will be created for each entry in the content type
        #   path: (entry) ->              # override function for generating single page file path, passed in the entry object
        # }
      ]
  ]
