require 'rails_helper'

describe CreatesProject do
  it "creates a project given a name" do
    creator = CreatesProject.new(name: "Project Runway")
    creator.build
    expect(creator.project.name).to eq("Project Runway")
  end
end

describe "task string parsing" do
  it "handles an empty string" do
    creator = CreatesProject.new(name: "Project Runway", task_string: "")
    tasks = creator.convert_string_to_tasks
    expect(tasks.size).to eq(0)
  end
end
