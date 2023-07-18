class CreateTestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users, id: false do |t|
        t.belongs_to :test
        t.belongs_to :user

      t.timestamps
    end
  end
end
