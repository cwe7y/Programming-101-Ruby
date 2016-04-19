class TasksController < ApplicationController
  before_action :set_lecture, only: [:index, :create]

   def index #Никога няма да вземе два action method-a
     @tasks = @lecture.tasks
  end

  def new
    @task = Task.new
  end
  #POST lectures/1/tasks
  def create
    #@lecture = Lecture.find(params[:lecture_id]) #1 ; направигме callback место това ^ before_action
    @task  = @lecture.tasks.build(task_params)
    #@task = Task.new(task_params)
    # @task.lecture_id = params[:lecture_id] вместо 1
    if @task.save
      redirect_to lecture_tasks_path(params[:lecture_id]) 
    else
      render :new , status: :unprocessable_entity #error 422
    end
  end
  
  def show
    @task = @lecture.tasks.find(params[:id])    
  end  
  def edit
    @task = @lecture.tasks.find(params[:id])
  end

  def update
    #Task.where(lecture_id :params[lecture_id], id: params[:id].take!)
    @task = @lecture.tasks.find(params[:id])
     if @task.update(task_params)
      redirect_to lecture_tasks_path(params[:lecture_id]) 
    else
      render :new , status: :unprocessable_entity #error 422
    end
    
  end

  private
def task_params
  params.require(:task).permit(:name, :description)
end

def set_lecture
       @lecture = Lecture.find(params[:lecture_id])
end
end