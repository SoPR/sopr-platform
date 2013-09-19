require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :where => "MyString",
      :url => "MyString",
      :image => "MyString",
      :user => nil
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "input#event_where[name=?]", "event[where]"
      assert_select "input#event_url[name=?]", "event[url]"
      assert_select "input#event_image[name=?]", "event[image]"
      assert_select "input#event_user[name=?]", "event[user]"
    end
  end
end
