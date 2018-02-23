class Volunteer
  attr_accessor(:name)
  attr_reader(:project_id, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end

  def ==(another_volunteer)
    (self.name == another_volunteer.name) & (self.project_id == another_volunteer.project_id) & (self.id == another_volunteer.id)
  end

end
