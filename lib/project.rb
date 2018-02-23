class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each do |project|
      title = project['title']
      id = project['id'].to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def == another_project
    (self.title == another_project.title) & (self.id == another_project.id)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.find(id)
    found_project = nil
    Project.all.each do |project|
      if project.id == id
        found_project = project
      end
    end
    found_project
  end

  def update(attributes)
    @title = attributes[:title]
    @id = self.id
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end
end
