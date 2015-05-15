require 'rails_helper'

RSpec.describe "admin/sports/show", type: :view do
  before(:each) do
    @admin_sport = assign(:admin_sport, Admin::Sport.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
