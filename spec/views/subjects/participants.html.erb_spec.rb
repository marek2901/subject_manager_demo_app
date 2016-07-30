require 'rails_helper'

RSpec.describe "subjects/participants", type: :view do
  before(:each) do
    assign(:subject, create(:subject_with_students))
  end

  it "renders a list of subject participants" do
    render

    assert_select "tr>td", :text => "Example".to_s, :count => 3
    assert_select "tr>td", :text => "Student".to_s, :count => 3
  end
end
