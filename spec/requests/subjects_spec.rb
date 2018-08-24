require 'rails_helper'

RSpec.describe 'Subjects', type: :request do
  context 'signed_in' do
    before(:each) do
      sign_in(create(:user), scope: :user)
    end

    describe 'GET /subjects' do
      it 'works! (now write some real specs)' do
        get subjects_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
