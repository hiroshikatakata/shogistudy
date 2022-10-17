# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email                 { 'test@gmail.com' }
    password              { '111111' }
    password_confirmation { '111111' }
  end
end
