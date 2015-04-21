require 'rails_helper'

describe ProjectsController do

  describe 'GET #show' do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:project) { create(:project, category_id: category.id, user_id: user.id) }
    before { sign_in user }
    def do_request
      get :show, id: project.id
    end

    it 'renders project' do
      do_request
      expect(response).to render_template :show
      expect(:project).not_to be_nil
    end
  end

  describe 'GET #my_project' do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:project) { create(:project, category_id: category.id, user_id: user.id) }
    before { sign_in user }
    def do_request
      get :own
    end

    it 'renders list of projects' do
      do_request

      expect(response).to render_template :index
      expect(:projects).not_to be_nil
    end
  end

  describe 'GET #new' do
    let(:user) { create(:user) }
    before { sign_in user }
    def do_request
      get :new
    end

    it 'renders new project form' do
      do_request

      expect(response).to render_template :new
      expect(:project).not_to be_nil
    end
  end

  describe 'POST #create' do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    before { sign_in user }

    def do_request
      post :create, project: project_params
    end

    context 'valid project param' do

      let(:project_params) { attributes_for(:project, category_id: category.id, user_id: user.id,
                                            project_steps_attributes: [attributes_for(:project_step)],
                                            resources_attributes: [attributes_for(:resource)],
                                            services_attributes: [attributes_for(:service)]
                                            )}

      it 'create new project' do
        do_request
        expect(response).to redirect_to my_projects_path
        expect(flash[:notice]).to_not be_nil
      end
    end

    context 'project param without category, user' do
      let(:project_params) { attributes_for(:project)}
      it 're-renders the form project and sets the error message' do
        do_request
        expect(response).to render_template :new
        expect(flash[:alert]).to_not be_nil
      end
    end
  end

  describe 'GET #edit' do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:project) { create(:project, category_id: category.id, user_id: user.id) }
    before { sign_in user }

    def do_request
      get :edit, id: project.id
    end

    it 'renders form edit' do
      do_request

      expect(response).to render_template :edit
      expect(assigns(:project)).to_not be_nil
    end
  end


  describe 'PUT #update' do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:project) { create(:project, category_id: category.id, user_id: user.id) }
    before { sign_in user }

    def do_request
      put :update, id: project.id, project: project_params
    end

    context 'valid project param' do
      let(:project_params) { attributes_for(:project, title: 'Build a shot') }

      it 'update project, show message success, redirect to my projects' do
        do_request
        expect(Project.last.title).to eq 'Build a shot'
        expect(response).to redirect_to my_projects_path
        expect(flash[:notice]).to_not be_nil
      end

    end

    context 'user status param without message' do
      let(:project_params) { attributes_for(:project, title: '') }

      it 'update project, return message fail' do
        do_request
        expect(response).to render_template :edit
        expect(flash[:alert]).to_not be_nil
      end
    end
  end
end
