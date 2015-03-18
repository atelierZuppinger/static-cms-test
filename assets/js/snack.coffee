snack     = require './snack/snack.js'
snack     = require './snack/snack-slick.js'

# snack extends to add toggleClass
snack.wrap.define 'toggleClass', (className) ->
    this.each (element) -> 
        if className in element.classList
            snack.wrap(element).removeClass className
        else
            snack.wrap(element).addClass className

# use Slick to select element with snack.wrap
snack.wrap.defineEngine (selector, context) ->
    context = Slick.search(document,context)[0] if typeof context is 'string'
    Slick.search context || document, selector

module.exports = snack