require 'rails_helper'

RSpec.describe 'subjects/participants', type: :view do
  before(:each) do
    @subject = create(:subject_with_students)
    assign(:subject, @subject)
  end

  it 'renders a list of subject participants' do
    render

    assert_select 'tr>td', text: 'Example'.to_s, count: 3
    assert_select 'tr>td', text: 'Student'.to_s, count: 3
  end

  it 'has removal links' do
    render
    @subject.students.each do |student|
      expect(rendered).to have_link('Unassign', href: unassing_participant_from_subject_path(id: @subject.id, participant_id: student.id))
    end
  end
end
