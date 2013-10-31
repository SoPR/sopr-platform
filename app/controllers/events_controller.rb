class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  # GET /events.rss
  # GET /events.ics
  def index
    @events = Event.where(['date >= ?', DateTime.now.utc]).order('date')

    respond_to do |format|
      format.html
      format.json
      format.rss { render :layout => false }
      format.ics { send_data(events_to_ical(), :filename => "sopr.ics",
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
    def events_to_ical()
      render_to_string(:action => "index.ics.erb", :layout => false)
    end
end
