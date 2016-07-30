require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'is not saved without title' do
    expect { create(:subject, title: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is saved with valid params' do
    expect { create(:subject) }.to change(Subject, :count).by(1)
  end
end
