module StartupsHelper
  def market_names(markets)
    markets.map { |market| market.name }
  end

  def market_names_list(markets)
    market_names(markets).each do |market|
      concat content_tag(:li, market, class: 'markets')
    end
  end
end
