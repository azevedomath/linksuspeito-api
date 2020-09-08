require 'rails_helper'

RSpec.describe "urls/new", type: :view do
  before(:each) do
    assign(:url, Url.new(
      destination: "MyString",
      user: nil,
      url: "MyString",
      clicked: 1,
      active: false
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "input[name=?]", "url[destination]"

      assert_select "input[name=?]", "url[user_id]"

      assert_select "input[name=?]", "url[url]"

      assert_select "input[name=?]", "url[clicked]"

      assert_select "input[name=?]", "url[active]"
    end
  end
end
