require 'rails_helper'

describe ProjectsController do


  describe 'POST #create' do
    let!(:category) { create(:category) }
    let!(:user) { create(:user) }
    before { sign_in user }

    def do_request
      post :create, project: project_params
    end

    context 'valid project param' do

      let(:project_params) { attributes_for(:project, category_id: category.id, user_id: user.id,
                                            project_steps_attributes: [attributes_for(:project_step)],
                                            resources_attributes: [attributes_for(:resource)]
                                            )}

      it 'create new project' do
        do_request
        expect(flash[:notice]).to_not be_nil
      end
    end

    context 'project param without category, user' do
      let(:project_params) { attributes_for(:project)}
      it 're-renders the form project and sets the error message' do
        do_request

        expect(flash[:alert]).to_not be_nil
      end
    end
  end
end
