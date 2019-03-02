class BoardsController < ApplicationController
before_action :set_board, only: [:show, :edit, :update, :destroy]
before_action :set_lists
before_action :set_tasks

  def index
    @boards = Board.all_boards(current_user.id)
    if @boards.first != nil
      redirect_to board_path(@boards.first)
    end
  end

  def new
    @board = Board.new
    render "form"
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
    redirect_to boards_path
    else
      render "form"
    end   
  end

  def edit
    render "form"
  end

  def update
    if @board.update(board_params)
    redirect_to board_path(@board)
    else
    render "form"
    end
  end

  def show
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private
  
    def board_params
      params.require(:board).permit(:name)
    end

    def set_board
      #@board = current_user.boards.find(params[:id])
      @board = Board.find_board(current_user.id, params[:id])
    end

    def set_lists
      @lists = @board ? @board.lists : []
      @lists = @lists.sort_by { |l| l.priority }
    end

    def set_tasks
      @tasks = @list ? @list.tasks : []
    end

end
