require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
        stub_model(Event,
          :name => "Name",
          :place => "Place",
          :image => "Image",
          :url => "Url"
        ),
        stub_model(Event,
          :name => "Name",
          :place => "Place",
          :image => "Image",
          :url => "Url"
        )
      ])
    assign(:events, [FactoryGirl.create(:event), FactoryGirl.create(:event)])
  end

  it "renders a list of events" do
    render

    assert_select 'div.row-fluid' do |element|
      assert_select 'h3.group-monthly-title', 1
    end

    assert_select 'div.row-fluid' do |element|
      assert_select 'h1.event-title', 2
      assert_select 'h2.event-place', 2
      assert_select 'h3.event-time-date', 2
    end
  end
end
