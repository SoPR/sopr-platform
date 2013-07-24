module StartupsHelper
  def market_names_list(startup)
    startup.market_list.each do |market|
      concat content_tag(:li, market, class: 'markets')
    end
  end
end
