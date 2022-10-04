# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user
  has_many :responses
  mount_uploaders :image_name, ImageNameUploader
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }
  serialize :image_name, Array
end
