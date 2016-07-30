require 'rails_helper'

RSpec.describe Student, type: :model do
  
  it 'is not saved when first_name is not provided' do
    expect { create(:student, first_name: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is not saved when last_name is not provided' do
    expect { create(:student, last_name: nil) }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'is saved with valid params' do
    expect { create(:student) }.to change(Student, :count).by(1)
  end

end
