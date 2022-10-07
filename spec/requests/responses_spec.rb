# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards', type: :request do
  describe '#new' do
    before do
      @user = FactoryBot.create(:user)
      @board = FactoryBot.create(:board, user_id: @user.id)
      @responses = FactoryBot.create(:response, board_id: @board.id)
      get new_board_response_path(@board.id)
    end

    it 'ステータスが200であること' do
      expect(response).to have_http_status '200'
    end
  end
end
