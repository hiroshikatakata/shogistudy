# frozen_string_literal: true

class ResponsesController < ApplicationController
  def new
    @board = Board.find(params[:board_id])
    @response = Response.new
    @responses = Response.where('board_id = ?', @board.id)
  end

  def create
    @board = Board.find(params[:board_id])
    @responses = Response.where('board_id = ?', @board.id)
    @response = @board.responses.create(response_params)
    if @response.save
      redirect_to new_board_response_path(@board.id)
    else
      render :new
    end
  end

  private

  def response_params
    params.require(:response).permit(:body, :image_name)
  end
end
