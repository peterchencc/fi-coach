require 'rails_helper'

RSpec.describe "admin/coaches/show", type: :view do
  before(:each) do
    @admin_coach = assign(:admin_coach, Admin::Coach.create!(
      :coach_name => "Coach Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Coach Name/)
  end
end
