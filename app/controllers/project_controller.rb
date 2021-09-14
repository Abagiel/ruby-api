class ProjectController < ApplicationController
 skip_before_action :verify_authenticity_token
  def index
  	projects = Project.all

  	render json: projects.as_json(include: {
      todos: { except: [:project_id] }
    }, root: false), status: 200
  end

  def update
  	todo = Todo.find(params[:todoId])

  	Todo.where(id: params[:todoId]).update(isCompleted: !todo.isCompleted)

  	render json: todo.id, status: 200
  end

  def create
  	todos = Todo.all
  	projects = Project.all

    todo = nil
  	projectId = project_params[:id].to_i


  	if !!project_params[:title]
	  	project = Project.new
	  	project.title = project_params[:title]
	  	project.save()	 

      projectId = project.id
  	end

    if !!project_params[:text]
      todo = Todo.create(text: project_params[:text], isCompleted: false, project_id: projectId)
    end

  	render json: todo.id, status: 200
  end

  def project_params
  	params.permit(:id, :title, :text)
  end
end
