require 'rails_helper'

RSpec.describe "admin/coaches/edit", type: :view do
  before(:each) do
    @admin_coach = assign(:admin_coach, Admin::Coach.create!(
      :coach_name => "MyString"
    ))
  end

  it "renders the edit admin_coach form" do
    render

    assert_select "form[action=?][method=?]", admin_coach_path(@admin_coach), "post" do

      assert_select "input#admin_coach_coach_name[name=?]", "admin_coach[coach_name]"
    end
  end
end
