$ ->
    $body = $('body')
    bodyClass = $body.attr 'class'
    routes = ['startups-new', 'startups-edit']

    if bodyClass in ['startups-new', 'startups-edit']
        $markets = $("#startup_market_list")

        $markets.tokenInput "http://api.angel.co/1/search?type=MarketTag",
          crossDomain: true,
          queryParam: "query",
          prePopulate: $markets.data('pre'),
          theme: "facebook",
          tokenLimit: 3,
          tokenValue: "name"
    else if bodyClass is 'startups-index'
        $(".startupcard").equalHeights()