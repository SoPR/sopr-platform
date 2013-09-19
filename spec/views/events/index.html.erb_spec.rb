require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :where => "Where",
        :url => "Url",
        :image => "Image",
        :user => nil
      ),
      stub_model(Event,
        :name => "Name",
        :where => "Where",
        :url => "Url",
        :image => "Image",
        :user => nil
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Where".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
