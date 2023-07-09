class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.string :autor, null: false
      t.belongs_to :category
      t.belongs_to :user

      t.timestamps
    end
  end
end
