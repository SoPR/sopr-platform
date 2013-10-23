require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :place => "Place",
      :image => "Image",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Place/)
    rendered.should match(/Image/)
    rendered.should match(/Url/)
  end
end
