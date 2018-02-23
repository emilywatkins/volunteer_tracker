class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project['title']
      id = project['id'].to_i()
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def == another_project
    (self.title == another_project.title) & (self.id == another_project.id)
  end
end
