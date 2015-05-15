require 'rails_helper'

RSpec.describe "admin/coaches/new", type: :view do
  before(:each) do
    assign(:admin_coach, Admin::Coach.new(
      :coach_name => "MyString"
    ))
  end

  it "renders new admin_coach form" do
    render

    assert_select "form[action=?][method=?]", admin_coaches_path, "post" do

      assert_select "input#admin_coach_coach_name[name=?]", "admin_coach[coach_name]"
    end
  end
end
