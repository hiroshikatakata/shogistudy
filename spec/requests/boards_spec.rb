# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards', type: :request do
  describe '#new' do
    before do
      get new_board_path
    end

    it 'ステータスが200であること' do
      expect(response).to have_http_status '200'
    end
  end

  describe '#index' do
    before do
      get boards_path
    end

    it 'ステータスが200であること' do
      expect(response).to have_http_status '200'
    end
  end

  describe '#show' do
    before do
      @user = FactoryBot.create(:user)
      @board = FactoryBot.create(:board, user_id: @user.id)
      sign_in @user
      get board_path(1)
    end

    it 'ステータスが200であること' do
      expect(response).to have_http_status '200'
    end
  end
end
