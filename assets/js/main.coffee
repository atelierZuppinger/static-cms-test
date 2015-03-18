page      = require 'page'
snack     = require './snack.coffee'
diaporama = require './diaporama.coffee'

# router
page '/', (context, next) ->
    next()
    diaporama.init(snack.wrap('#diaporama')[0])
page '/programme', (context, next) ->
    next()
    evt = snack.wrap('#'+context.hash)
    if evt[0] instanceof HTMLElement
        evt.toggleClass('opened')
    else
        snack.wrap('.event').removeClass('opened')
page '/galeries/:galerie', (context, next) ->
    next()
    container = snack.wrap('#imageContainer')[0]
    img = snack.wrap('a[href=#' + context.hash + '] img') if context.hash
    container.src = img[0].dataset.originalHref + '?w=500' if img

snack.ready () -> 
    page.start()
    snack.listener {node: window, event: 'hashchange'}, ->
        page()