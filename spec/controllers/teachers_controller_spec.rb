require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  let(:valid_attributes) do
    { first_name: 'first', last_name: 'last', title: 'Prof.' }
  end

  let(:invalid_attributes) do
    { first_name: 'first', last_name: 'last', title: 'wrong title' }
  end

  let(:valid_session) { {} }

  context 'signed_in' do
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(create(:user), scope: :user)
    end

    describe 'GET #index' do
      it 'assigns all teachers as @teachers' do
        teacher = Teacher.create! valid_attributes
        get :index, {}, session: valid_session
        expect(assigns(:teachers)).to eq([teacher])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested teacher as @teacher' do
        teacher = Teacher.create! valid_attributes
        get :show, { id: teacher.to_param }, session: valid_session
        expect(assigns(:teacher)).to eq(teacher)
      end
    end

    describe 'GET #new' do
      it 'assigns a new teacher as @teacher' do
        get :new, {}, session: valid_session
        expect(assigns(:teacher)).to be_a_new(Teacher)
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested teacher as @teacher' do
        teacher = Teacher.create! valid_attributes
        get :edit, { id: teacher.to_param }, session: valid_session
        expect(assigns(:teacher)).to eq(teacher)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Teacher' do
          expect do
            post :create, { teacher: valid_attributes }, session: valid_session
          end.to change(Teacher, :count).by(1)
        end

        it 'assigns a newly created teacher as @teacher' do
          post :create, { teacher: valid_attributes }, session: valid_session
          expect(assigns(:teacher)).to be_a(Teacher)
          expect(assigns(:teacher)).to be_persisted
        end

        it 'redirects to the created teacher' do
          post :create, { teacher: valid_attributes }, session: valid_session
          expect(response).to redirect_to(Teacher.last)
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved teacher as @teacher' do
          post :create, { teacher: invalid_attributes }, session: valid_session
          expect(assigns(:teacher)).to be_a_new(Teacher)
        end

        it "re-renders the 'new' template" do
          post :create, { teacher: invalid_attributes }, session: valid_session
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) do
          { first_name: 'Other' }
        end

        it 'updates the requested teacher' do
          teacher = Teacher.create! valid_attributes
          put :update, { id: teacher.to_param, teacher: new_attributes }, session: valid_session
          teacher.reload
          expect(teacher.first_name).to eq 'Other'
        end

        it 'assigns the requested teacher as @teacher' do
          teacher = Teacher.create! valid_attributes
          put :update, { id: teacher.to_param, teacher: valid_attributes }, session: valid_session
          expect(assigns(:teacher)).to eq(teacher)
        end

        it 'redirects to the teacher' do
          teacher = Teacher.create! valid_attributes
          put :update, { id: teacher.to_param, teacher: valid_attributes }, session: valid_session
          expect(response).to redirect_to(teacher)
        end
      end

      context 'with invalid params' do
        it 'assigns the teacher as @teacher' do
          teacher = Teacher.create! valid_attributes
          put :update, { id: teacher.to_param, teacher: invalid_attributes }, session: valid_session
          expect(assigns(:teacher)).to eq(teacher)
        end

        it "re-renders the 'edit' template" do
          teacher = Teacher.create! valid_attributes
          put :update, { id: teacher.to_param, teacher: invalid_attributes }, session: valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested teacher' do
        teacher = Teacher.create! valid_attributes
        expect do
          delete :destroy, { id: teacher.to_param }, session: valid_session
        end.to change(Teacher, :count).by(-1)
      end

      it 'redirects to the teachers list' do
        teacher = Teacher.create! valid_attributes
        delete :destroy, { id: teacher.to_param }, session: valid_session
        expect(response).to redirect_to(teachers_url)
      end
    end

    describe 'GET #subjects' do
      it 'show teacher subject list list' do
        teacher = create(:teacher_with_subjects)
        get :subjects, id: teacher.id
        expect(assigns(:teacher)).to eq(teacher)
      end
    end
  end
end
