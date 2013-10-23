require "spec_helper"

describe EventsController do
  describe "routing" do

    it "routes to #index" do
      get("/events").should route_to("events#index")
    end

  end
end
