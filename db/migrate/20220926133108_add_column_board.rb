class AddColumnBoard < ActiveRecord::Migration[6.1]
  def change
    add_reference :responses, :board, foreign_key: true
  end
end
