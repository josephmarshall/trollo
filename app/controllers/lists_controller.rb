class ListsController < ApplicationController
before_action :set_board
before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all_lists(@board.id)
    #@lists = @board.lists
  end

  def new
    @list = @board.lists.new
    render '/layouts/_list_form'
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to board_path(@board)
    else
      render '/layouts/_list_form'
    end
  end
  
  def edit
    render '/layouts/_list_form'
  end
  
  def update
    if @list.update(list_params)
      redirect_to board_path(@board)
    else
      render '/layouts/_list_form'
    end
  end

  def show
  end

  def destroy
    @list.destroy
    redirect_to board_path(@board)
  end
  
  private
  
  def list_params
    params.require(:list).permit(:name, :priority, :board_id)
  end
  
  def set_list
    @list = List.find_list(@board.id, params[:id])
    #@list = List.find(params[:id])
  end
  
  def set_board
    @board = current_user.boards.find(params[:board_id])
  end
  
end

