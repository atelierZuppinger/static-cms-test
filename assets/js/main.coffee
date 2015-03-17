page = require 'page'
snack = require './snack/snack.js'
require './snack/snack-slick.js'

showHide = (e) -> 
    evt = snack.wrap '! .event', e.target
    evt.toggleClass 'opened'

# use Slick to select element with snack.wrap
snack.wrap.defineEngine (selector, context) ->
    context = Slick.search(document,context)[0] if typeof context is 'string'
    Slick.search context || document, selector

# snack extends to add toggleClass
snack.wrap.define 'toggleClass', (className) ->
    this.each (element) -> 
        if className in element.classList
            snack.wrap(element).removeClass className
        else
            snack.wrap(element).addClass className

snack.ready () -> 
    triggers = snack.wrap '.viewmore, .more'
    triggers.each (element,index) ->
        snack.wrap(element).attach 'click', showHide