initialize = () ->
    $markets = $("#startup_market_list")

    $markets.tokenInput "http://api.angel.co/1/search?type=MarketTag",
      crossDomain: true,
      queryParam: "query",
      prePopulate: $markets.data('pre'),
      theme: "facebook",
      tokenLimit: 3,
      tokenValue: "name"

$ ->
    $body = $('body')
    routes = ['startups-new', 'startups-edit']

    if _.some(routes, (route) -> $body.hasClass route)
        initialize()