# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    sequence(:title) { |n| "test_title#{n}" }
    sequence(:body) { |n| "test_body#{n}" }
  end
end
