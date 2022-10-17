# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :board
  mount_uploader :image_name, ImageNameUploader
  validates :body, presence: true, length: { maximum: 500 }
end
