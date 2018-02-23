require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @projects = Project.all
  erb(:index)
end

post('/') do
  title = params['title']
  project = Project.new({:title => title, :id => nil})
  project.save
  @projects = Project.all
  erb(:index)
end

get('/projects/:id') do
  @project = Project.find(params['id'].to_i)
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params['id'].to_i)
  erb(:project_edit)
end

patch('/projects/:id') do
  title = params['title']
  @project = Project.find(params['id'].to_i)
  @project.update({:title => title})
  erb(:project)
end
