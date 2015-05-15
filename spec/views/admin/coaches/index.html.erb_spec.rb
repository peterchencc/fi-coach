require 'rails_helper'

RSpec.describe "admin/coaches/index", type: :view do
  before(:each) do
    assign(:admin_coaches, [
      Admin::Coach.create!(
        :coach_name => "Coach Name"
      ),
      Admin::Coach.create!(
        :coach_name => "Coach Name"
      )
    ])
  end

  it "renders a list of admin/coaches" do
    render
    assert_select "tr>td", :text => "Coach Name".to_s, :count => 2
  end
end
