page      = require 'page'
zeptoBrowserify = require 'zepto-browserify'
$ = zeptoBrowserify.$
diaporama = require './diaporama.coffee'

checkSize = (e) ->
    if $(window).height() < $('#right').height()
        $('body').addClass('scroll')
    else
        $('body').removeClass('scroll')

# router
page '/', (context, next) ->
    next()
    diaporama.init($('#diaporama')[0])
page '/programme', (context, next) ->
    next()
    evt = $('#'+context.hash)
    if evt[0] instanceof HTMLElement
        evt.addClass('opened')
    else
        $('.event').removeClass('opened')
page '/galeries/:galerie', (context, next) ->
    next()
    container = $('#imageContainer')[0]
    img = $('#' + context.hash + 'find img') if context.hash
    container.src = img[0].dataset.originalHref + '?w=500' if img

$ () -> 
    page.start()
   
$ window
    .on 'hashchange', (e) ->
        page()
    .on 'resize', checkSize
    .on 'load', checkSize