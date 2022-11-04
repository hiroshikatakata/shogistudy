# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy
  mount_uploaders :image_name, ImageNameUploader
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }
  serialize :image_name, Array

  def self.sort_boards(sort)
    if sort[:sort] == "created_at_asc"
      order("created_at ASC")
    elsif sort[:sort] == "created_at_desc"
      order("created_at DESC")
    end
  end

  scope :sort_list, -> {
    {
      "並び替え" => "",
      "作成の古い順" => "created_at_asc",
      "作成の新しい順" => "created_at_desc"
    }
  }
end
