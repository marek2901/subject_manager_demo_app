require 'rails_helper'

RSpec.describe "subjects/show", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :title => "Title",
      :teacher => create(:teacher)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end

  it "has link to participants" do
    render
    expect(rendered).to have_link("Participants", href: subjects_participants_path(id: @subject.id))
  end

  it "shows teacher name" do
    render

    expect(rendered).to match(/Example Teacher/)
  end
end
