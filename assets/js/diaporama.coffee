zeptoBrowserify = require 'zepto-browserify'
$ = zeptoBrowserify.$

diaporama =
    images: []
    current: 0
    init: (container) ->
        @images = $('img', container)
        setInterval( (() => @next()), 6000)
    next: () ->
        @images.removeClass 'active'
        @current = if @current < @images.length-1 then @current+1 else 0
        $(@images[@current]).addClass 'active'

module.exports = diaporama