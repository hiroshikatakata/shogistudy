require 'rails_helper'

RSpec.describe User, type: :model do
  it 'email, passwordがあれば有効な状態か確認' do
    user = User.new(
      email:    "test@test.com",
      password: "testtest"
    )
    expect(user).to be_valid
  end

  it 'emailが無ければ無効な状態か確認' do
    user = User.new(
      email:    nil,
      password: "testtest"
    )
    user.valid?
    expect(user.errors.full_messages).to include("Eメールを入力してください")
  end

  it 'emailは@が含まれていなければ無効な状態か確認' do
    user = User.new(
      email:    "test.com",
      password: "testtest"
    )
    user.valid?
    expect(user.errors.full_messages).to include("Eメールは不正な値です")
  end

  it 'passwordが5文字以下では無効な状態か確認' do
    user = User.new(
      email:    "test@test.com",
      password: "test"
    )
    user.valid?
    expect(user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
  end

  it 'passwordが5文字以下では無効な状態か確認' do
    user = User.new(
      email:    "test@test.com",
      password: nil
    )
    user.valid?
    expect(user.errors.full_messages).to include('パスワードを入力してください')
  end
end
