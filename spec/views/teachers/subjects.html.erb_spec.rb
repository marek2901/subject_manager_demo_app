require 'rails_helper'

RSpec.describe 'teachers/subjects', type: :view do
  before(:each) do
    @teacher = create(:teacher_with_subjects)
    assign(:teacher, @teacher)
  end

  it 'renders a list of teacher subjects' do
    render
    assert_select 'tr>td', text: 'SubjectTitle'.to_s, count: 3
  end

  it 'has link to create new subject' do
    render

    expect(rendered).to have_link('New Subject', href: new_subject_path(teacher_id: @teacher.id))
  end
end
