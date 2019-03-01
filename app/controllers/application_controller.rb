class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_boards

  def set_boards
  @boards = current_user ? current_user.boards : []
  end

end
