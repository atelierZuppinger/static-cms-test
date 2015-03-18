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

snack.ready () -> 
    page.start()
