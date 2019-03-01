class TasksController < ApplicationController
  before_action :set_list
  before_action :set_tasks

  def index
    @tasks = @list.tasks
  end

  def new
  end

  def create
  end


  def edit
  end

def update
end


  def show
  end

  private
  
  def set_list
    @list = list.find(params[:list_id])
  end

  def set_tasks
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :priority, :list_id)
  end

  def set_task
    @task = task.find(params[:id])
  end

  def set_list
    @list = @board.lists.find(params[:list_id])
  end

end
