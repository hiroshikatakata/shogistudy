# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards', type: :system do
  describe 'GET #index' do
    context 'ログイン状態' do
      before do
        @user = FactoryBot.create(:user)
        @boards = FactoryBot.create_list(:board, 4, user_id: @user.id)
        sign_in @user
        visit boards_path
      end

      it '新規議題作成リンクのリンク先がboards#newになっているか確認' do
        click_link('新規議題作成')
        expect(current_path).to eq new_board_path
      end

      it '作成した議題を確認リンクのリンク先がboards/1になっているか確認' do
        click_link('作成した議題を確認')
        expect(current_path).to eq '/boards/1'
      end

      it '議題一覧が表示されているか確認' do
        @boards.each do |board|
          expect(page).to have_content board.title
          expect(page).to have_link href: new_board_response_path(board.id)
        end
      end

      it '議題タイトルのリンク先がnew_board_response_path(board.id)になっているか確認' do
        click_link(@boards[0].title)
        expect(current_path).to eq new_board_response_path(@boards[0].id)
      end

      it 'ログアウト出来るか確認' do
        click_button('ログアウト')
        expect(page).to have_no_link 'ログアウト'
        expect(page).to have_link 'ログイン', href: new_user_session_path
        expect(page).to have_link '登録する', href: new_user_registration_path
      end
    end

    context '非ログイン状態' do
      before do
        @user = FactoryBot.create(:user)
        @boards = FactoryBot.create_list(:board, 4, user_id: @user.id)
        visit boards_path
      end

      it '議題一覧が表示されているか確認' do
        @boards.each do |board|
          expect(page).to have_content board.title
          expect(page).to have_link href: new_board_response_path(board.id)
        end
      end

      it '新規議題作成がリンクではなくテキストであることを確認' do
        expect(page).not_to have_link '新規議題作成'
        expect(page).to have_content '新規議題作成'
      end

      it '作成した議題を確認がリンクではなくテキストであることを確認' do
        expect(page).not_to have_link '作成した議題を確認'
        expect(page).to have_content '作成した議題を確認'
      end

      it 'ログインリンクのリンク先がnew_user_session_pathになっているか確認' do
        click_link('ログイン')
        expect(current_path).to eq '/users/sign_in'
      end

      it 'ログインリンクのリンク先がnew_user_session_pathになっているか確認' do
        click_link('登録する')
        expect(current_path).to eq '/users/sign_up'
      end
    end
  end

  describe 'GET #new' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
      visit new_board_path
    end

    it 'title+body+画像が保存できるか+boards_pathに遷移されるか確認' do
      expect do
        fill_in('議題名', with: 'test title')
        fill_in('議題内容', with: 'test body')
        attach_file('画像', 'app/assets/images/adpDSC_6819.jpg')
        click_button('投稿する')
        expect(current_path).to eq boards_path
      end.to change { Board.count }.by(1)
    end

    it 'title+bodyが空の状態では保存できないか＋boards_pathに遷移されエラーメッセージが表示されるか確認' do
      expect do
        fill_in('議題名', with: '')
        fill_in('議題内容', with: '')
        click_button('投稿する')
        expect(current_path).to eq boards_path
        expect(page).to have_content '議題名を入力してください'
        expect(page).to have_content '議題内容を入力してください'
      end.not_to(change { Board.count })
    end
  end

  describe 'GET #show' do
    before do
      @user = FactoryBot.create(:user)
      @boards = FactoryBot.create_list(:board, 4, user_id: @user.id)
      @respons = FactoryBot.create(:response, board_id: @boards[0].id)
      sign_in @user
      visit board_path(1)
    end
    it '作成議題が全て表示されているか確認' do
      @boards.each do |board|
        expect(page).to have_content board.title
        expect(page).to have_content board.responses.count
        expect(page).to have_link href: new_board_response_path(board.id)
      end
    end
    it '議題タイトルのリンク先がnew_board_response_path(board.id)になっているか確認' do
      first(:link, '返信を確認').click
      expect(current_path).to eq new_board_response_path(@boards[0].id)
    end
  end
end
