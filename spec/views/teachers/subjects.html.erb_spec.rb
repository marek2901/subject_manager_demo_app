require 'rails_helper'

RSpec.describe "teachers/subjects", type: :view do
  before(:each) do
    assign(:teacher, create(:teacher_with_subjects))
  end

  it "renders a list of teacher subjects" do
    render
    assert_select "tr>td", :text => "SubjectTitle".to_s, :count => 3
  end

  it "has link to create new subject" do
    render

    expect(rendered).to have_link("New Subject", href: new_subject_path)
  end
end
