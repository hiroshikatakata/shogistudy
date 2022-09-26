class RemoveBoardIdFromResponses < ActiveRecord::Migration[6.1]
  def change
    remove_column :responses, :board_id
  end
end
