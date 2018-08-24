require 'rails_helper'

RSpec.describe 'teachers/show', type: :view do
  before(:each) do
    @teacher = assign(:teacher, create(:teacher))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Example/)
    expect(rendered).to match(/Teacher/)
    expect(rendered).to match(/Dr\./)
  end

  it 'has link to teachers subbjects' do
    render

    expect(rendered).to have_link('Subjects', href: teacher_subjects_path(id: @teacher.id))
  end
end
