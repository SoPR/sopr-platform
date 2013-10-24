xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Startups of Puerto Rico"
    xml.description "A collection of Startup Events in Puerto Rico"
    xml.link events_url
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => events_url(format: :rss)

    for event in @events
      xml.item do
        xml.title event.name
        xml.description "At #{event.place} on #{event.date.strftime("%B %d @ %I:%M %p")}"
        xml.pubDate event.date.to_s(:rfc822)
        xml.link event.link
        xml.guid event.link
      end
    end
  end
end