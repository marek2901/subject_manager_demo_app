require 'rails_helper'

RSpec.describe 'subjects/edit', type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
                                  title: 'MyString',
                                  teacher: create(:teacher)
                                ))
  end

  it 'renders the edit subject form' do
    render

    assert_select 'form[action=?][method=?]', subject_path(@subject), 'post' do
      assert_select 'input#subject_title[name=?]', 'subject[title]'
    end
  end

  it 'has selected proper teacher ' do
    render

    expect(rendered).to have_select 'subject[teacher_id]', selected: @subject.teacher.full_name
  end
end
