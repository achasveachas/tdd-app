require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "POST create" do
    it "creates a project" do
      post :create, params: {project: {name: "Runway", tasks: "Start Something:2"}}
      expect(response).to redirect_to(projects_path)
      expect(assigns(:action).project.name).to eq("Runway")
    end
  end
end
