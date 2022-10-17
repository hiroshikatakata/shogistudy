# frozen_string_literal: true

FactoryBot.define do
  factory :response do
    sequence(:body) { |n| "test_response_body#{n}" }
  end
end
