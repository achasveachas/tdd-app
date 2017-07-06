class CreatesProject
  attr_accessor :name, :task_string, :project

  def initialize(name: "", task_string: "")
    @name = name
    @task_string = task_string
  end

  def build
    self.project = Project.new(name: name)
  end

  def convert_string_to_tasks
    tasks = []
    tasks << Task.new(title: self.task_string, size: 1) if self.task_string != ""
    tasks
  end

end
