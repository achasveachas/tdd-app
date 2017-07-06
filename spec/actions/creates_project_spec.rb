require 'rails_helper'

describe CreatesProject do
  it "creates a project given a name" do
    creator = CreatesProject.new(name: "Project Runway")
    creator.build
    expect(creator.project.name).to eq("Project Runway")
  end
end

describe "task string parsing" do
  let(:creator) {CreatesProject.new(name: "Project Runway", task_string: task_string)}
  let(:tasks) {creator.convert_string_to_tasks}

  describe "with an empty string" do
    let(:task_string) {""}
    specify {expect(tasks.size).to eq(0)}
  end

  describe "with a single string" do
    let(:task_string) {"Start Things"}
    specify {expect(tasks.size).to eq(1)}
    specify {expect(tasks.map(&:title)).to eq(["Start Things"])}
    specify {expect(tasks.map(&:size)).to eq([1])}
  end

  describe "with a single string with a size" do
    let(:task_string) {"Start Things:3"}
    specify {expect(tasks.size).to eq(1)}
    specify {expect(tasks.map(&:title)).to eq(["Start Things"])}
    specify {expect(tasks.map(&:size)).to eq([3])}
  end

  describe "with multiple tasks" do
    let(:task_string) {"Start Things:3\nEnd Things:2"}
    specify {expect(tasks.size).to eq(2)}
    specify {expect(tasks.map(&:title)).to eq(["Start Things", "End Things"])}
    specify {expect(tasks.map(&:size)).to eq([3, 2])}
  end

  describe "attaching tasks to the project" do
    let(:task_string) {"Start Things:3\nEnd Things:2"}
    it "saves the projects and tasks" do
      creator.create
      expect(creator.project.tasks.size).to eq(2)
      expect(creator.project).not_to be_a_new_record
    end
  end
end
