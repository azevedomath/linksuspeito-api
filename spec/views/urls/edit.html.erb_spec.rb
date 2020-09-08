require 'rails_helper'

RSpec.describe "urls/edit", type: :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      destination: "MyString",
      user: nil,
      url: "MyString",
      clicked: 1,
      active: false
    ))
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(@url), "post" do

      assert_select "input[name=?]", "url[destination]"

      assert_select "input[name=?]", "url[user_id]"

      assert_select "input[name=?]", "url[url]"

      assert_select "input[name=?]", "url[clicked]"

      assert_select "input[name=?]", "url[active]"
    end
  end
end
