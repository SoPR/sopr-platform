require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :place => "MyString",
      :image => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "input#event_place[name=?]", "event[place]"
      assert_select "input#event_image[name=?]", "event[image]"
      assert_select "input#event_url[name=?]", "event[url]"
    end
  end
end
