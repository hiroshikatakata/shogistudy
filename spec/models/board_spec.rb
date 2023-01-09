require 'rails_helper'

RSpec.describe Board, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'title+bodyがあれば有効な状態か確認' do
    board = Board.new(
      user: @user,
      title: "testtitle",
      body:  "testbody"
    )
    expect(board).to be_valid
  end

  it '画像が複数保存出来るか確認' do
    board = Board.new(
      user: @user,
      title: "testtitle",
      body:  "testbody",
      image_name: ["test.jpg", "test2.jpg"]
    )
    expect(board).to be_valid
  end

  it 'titleが無ければ無効な状態か確認' do
    board = Board.new(
      user: @user,
      title: nil,
      body:  "testbody"
    )
    board.valid?
    expect(board.errors.full_messages).to include('議題名を入力してください')
  end

  it 'bodyが無ければ無効な状態か確認' do
    board = Board.new(
      user: @user,
      title: "testtitle",
      body:  nil
    )
    board.valid?
    expect(board.errors.full_messages).to include('議題内容を入力してください')
  end

end
