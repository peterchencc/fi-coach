require 'rails_helper'

RSpec.describe "admin/sports/index", type: :view do
  before(:each) do
    assign(:admin_sports, [
      Admin::Sport.create!(
        :name => "Name"
      ),
      Admin::Sport.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of admin/sports" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
