require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it 'is not saved when first_name is not provided' do
    expect { create(:teacher, first_name: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is not saved when last_name is not provided' do
    expect { create(:teacher, last_name: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is not saved when provided wrong title' do
    expect { create(:teacher, title: "wrong") }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is saved with valid params' do
    expect { create(:teacher) }.to change(Teacher, :count).by(1)
  end
end
