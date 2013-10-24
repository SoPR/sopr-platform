require 'icalendar'

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where(['date >= ?', DateTime.now]).order('date')

    respond_to do |format|
      format.html
      format.json
      format.rss { render :layout => false }
      format.ics { send_data(events_to_ical(@events), :filename => "sopr.ics",
        :disposition => "inline; filename=sopr.ics", :type => "text/calendar")}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :place, :date, :image, :url)
    end

    # Returns Icalendar string for upcoming events
    def events_to_ical(events)
      cal = Icalendar::Calendar.new
      cal.prodid = '-//startupsofpuertorico.com//Startups of Puerto Rico//EN'
      events.each do |event|
        calendar_event = Icalendar::Event.new
        calendar_event.start = event.date
        calendar_event.summary = event.name
        calendar_event.description = "At #{event.place} on #{event.date.strftime("%B %d @ %I:%M %p")}"
        cal.add_event(calendar_event)
      end
      return cal.to_ical
    end
end
