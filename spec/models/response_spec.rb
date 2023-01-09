require 'rails_helper'

RSpec.describe Response, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @board = FactoryBot.create(:board, user_id: @user.id)
  end

  it 'bodyがあれば有効な状態か確認' do
    response = Response.new(
      board: @board,
      body:  "testbody"
    )
    expect(response).to be_valid
  end

  it '画像が保存できるか確認' do
    response = Response.new(
      board: @board,
      body:  "testbody",
      image_name: "test.jpg"
    )
    expect(response).to be_valid
  end

  it 'bodyが無ければ無効な状態か確認' do
    response = Response.new(
      board: @board,
      body:  nil
    )
    response.valid?
    binding.pry
    expect(response.errors.full_messages).to include('返信内容を入力してください')
  end
end
