require "rails_helper"

RSpec.describe 'home_page/index', type: :view do
  it 'should contain application name header' do
    render
    expect(rendered).to have_selector('h1', text: "Welcome to SubjectManagerDemo")
  end
end
