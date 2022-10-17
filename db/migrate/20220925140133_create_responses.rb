class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.text "body", null: false
      t.bigint "board_id"
      t.string "image_name"
      t.timestamps
    end
  end
end
