require 'rails_helper'

RSpec.describe 'Teachers', type: :request do
  context 'signed_in' do
    before(:each) do
      sign_in(create(:user), scope: :user)
    end

    describe 'GET /teachers' do
      it 'works! (now write some real specs)' do
        get teachers_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
