require 'rails_helper'

RSpec.describe "admin/sports/new", type: :view do
  before(:each) do
    assign(:admin_sport, Admin::Sport.new(
      :name => "MyString"
    ))
  end

  it "renders new admin_sport form" do
    render

    assert_select "form[action=?][method=?]", admin_sports_path, "post" do

      assert_select "input#admin_sport_name[name=?]", "admin_sport[name]"
    end
  end
end
