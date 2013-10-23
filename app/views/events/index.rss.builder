xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Startups of Puerto Rico"
    xml.description "A collection of Startup Events in Puerto Rico"
    xml.link events_url

    for event in @events
      xml.item do
        xml.title event.name
        xml.description "At #{event.place} on #{event.date.strftime("%B %d @ %I:%M %p")}"
        xml.pubDate event.date.to_s(:rfc822)
        xml.link event.url
        xml.guid event.url
      end
    end
  end
end