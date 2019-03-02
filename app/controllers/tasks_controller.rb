class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:edit, :update, :show, :destroy]
  before_action :set_board

  def index
    @tasks = Task.all_tasks(@list.id)
    #@tasks = @list.tasks
  end

  def new
    @task = Task.new
    render '_task_form'
  end

  def create
    @task =  @list.tasks.new(task_params)
    if @task.save
      redirect_to board_path(@board)
    else
      render '_task_form'
    end
  end


  def edit
    render '_task_form'
  end

  def update
    if @task.update(task_params)
    redirect_to board_path(@board)
    else
    render 'task_form'
    end 
  end


  def show
  end

  def destroy
    @task.destroy
    redirect_to board_path(@board)
  end


  private
  def task_params
    params.require(:task).permit(:name, :description, :list_id)
  end
  
  def set_list
    @list = list.find(params[:list_id])
  end  

  def set_task
    @task = Task.find_task(@list.id, params[:id])
    #@task = Task.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_board
    @board = @list.board
  end

end
