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
    task = task_string.split(":")
    title = task[0]
    size = task[1] || 1
    tasks << Task.new(title: title, size: size.to_i) if title
    tasks
  end

end
