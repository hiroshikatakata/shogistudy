# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @boards = Board.all
  end

  def show
    @user = current_user
    @boards = @user.boards
  end

  def new
    @user = current_user
    @board = Board.new
  end

  def create
    @user = current_user
    @board = @user.boards.create(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to '/boards/'
  end

  def search
    @results = @q.result
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, { image_name: [] })
  end

  def set_q
    @q = Board.ransack(params[:q])
  end
end
