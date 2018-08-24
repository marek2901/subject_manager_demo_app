require 'rails_helper'

RSpec.describe 'teachers/index', type: :view do
  before(:each) do
    assign(:teachers, [
             create(:teacher),
             create(:teacher)
           ])
  end

  it 'renders a list of teachers' do
    render
    assert_select 'tr>td', text: 'Example'.to_s, count: 2
    assert_select 'tr>td', text: 'Teacher'.to_s, count: 2
    assert_select 'tr>td', text: 'Dr.'.to_s, count: 2
  end
end
