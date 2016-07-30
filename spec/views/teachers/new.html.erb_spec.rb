require 'rails_helper'

RSpec.describe "teachers/new", type: :view do
  before(:each) do
    assign(:teacher, create(:teacher))
  end

  it "renders new teacher form" do
    render

    assert_select "input#teacher_first_name[name=?]", "teacher[first_name]"

    assert_select "input#teacher_last_name[name=?]", "teacher[last_name]"

    assert_select "input#teacher_title[name=?]", "teacher[title]"
  end
end
