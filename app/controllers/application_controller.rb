# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_search

  def after_sign_in_path_for(_resource)
    '/boards/'
  end

  def after_sign_out_path_for(_resource)
    '/boards/'
  end

  def set_search
    @search = Board.ransack(params[:q])
    @search_boards = @search.result.page(params[:page]).per(10)
  end
end
