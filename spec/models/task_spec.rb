require 'rails_helper'

RSpec.describe Project do
  it "can distinguish a completed task" do
    task = Task.new
    expect(task).not_to be_complete
    task.mark_completed
    expect(task).to be_complete

  end
end

describe "velocity" do
  let(:task) { Task.new(size: 3) }

  it "does not count an incomplete task towards velocity" do
    expect(task).not_to be_part_of_velocity
    expect(task.point_toward_velocity).to eq(0)
  end

  it "does not count a long-ago task towards velocity" do
    task.mark_completed(6.months.ago)
    expect(task).not_to be_part_of_velocity
    expect(task.point_toward_velocity).to eq(0)
  end

  it "does not count an incomplete task towards velocity" do
    task.mark_completed(1.day.ago)
    expect(task).to be_part_of_velocity
    expect(task.point_toward_velocity).to eq(3)
  end
end
