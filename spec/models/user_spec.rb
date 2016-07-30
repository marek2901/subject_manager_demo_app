require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user is created with valid params' do
    expect { create(:user) }.not_to raise_error
  end
end
