# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'responses', type: :system do
  describe 'GET #new' do
    before do
      @user = FactoryBot.create(:user)
      @board = FactoryBot.create(:board, user_id: @user.id)
      @responses = FactoryBot.create_list(:response, 4, board_id: @board.id)
      visit new_board_response_path(@board.id)
    end

    it 'board title+bodyが表示されているか確認' do
      expect(page).to have_content @board.title
      expect(page).to have_content @board.body
    end

    it '返信が全て表示されているか確認' do
      @responses.each do |respons|
        expect(page).to have_content respons.body
      end
    end

    it 'body+画像が保存できるか+new_board_response_path(@board.id)に遷移されるか確認' do
      expect do
        find('a', text: '▼ 返信する').click
        fill_in('response_body', with: 'test body')
        attach_file('response_image_name', 'app/assets/images/adpDSC_6819.jpg')
        click_button('返信する')
        expect(current_path).to eq new_board_response_path(@board.id)
      end.to change { Response.count }.by(1)
    end

    it 'bodyが空の状態では保存できないか＋boards_pathに遷移されエラーメッセージが表示されるか確認' do
      expect do
        find('a', text: '▼ 返信する').click
        fill_in('response_body', with: '')
        click_button('返信する')
        expect(page).to have_content '返信内容を入力してください'
        expect(current_path).to eq board_responses_path(@board.id)
      end.not_to(change { Response.count })
    end
  end
end
