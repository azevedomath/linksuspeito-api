require 'rails_helper'

RSpec.describe "urls/index", type: :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        destination: "Destination",
        user: nil,
        url: "Url",
        clicked: 2,
        active: false
      ),
      Url.create!(
        destination: "Destination",
        user: nil,
        url: "Url",
        clicked: 2,
        active: false
      )
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", text: "Destination".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
