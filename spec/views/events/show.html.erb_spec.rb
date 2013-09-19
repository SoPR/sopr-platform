require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :where => "Where",
      :url => "Url",
      :image => "Image",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Where/)
    rendered.should match(/Url/)
    rendered.should match(/Image/)
    rendered.should match(//)
  end
end
