require 'rails_helper'

RSpec.describe 'subjects/new', type: :view do
  before(:each) do
    assign(:subject, Subject.new(
                       title: 'MyString',
                       teacher: create(:teacher)
                     ))
  end

  it 'renders new subject form' do
    render

    assert_select 'form[action=?][method=?]', subjects_path, 'post' do
      assert_select 'input#subject_title[name=?]', 'subject[title]'
    end
  end

  it 'has select field for teacher' do
    DatabaseCleaner.clean_with(:truncation)
    teachers = [
      create(:teacher, first_name: 'First').full_name,
      create(:teacher, first_name: 'Second').full_name,
      create(:teacher, first_name: 'Third').full_name
    ]

    render

    expect(rendered).to have_select 'subject[teacher_id]', options: teachers
  end
end
