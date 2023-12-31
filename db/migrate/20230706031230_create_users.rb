class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :password, null: false
      t.string :context, null: false

      t.timestamps
    end
  end
end
