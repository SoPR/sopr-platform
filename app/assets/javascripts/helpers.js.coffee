$.fn.equalHeights = () ->
    max = -1

    $(this).each ->
        h = $(this).outerHeight()
        max = (if h > max then h else max)

    $(this).css "min-height": max