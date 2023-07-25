class RemoveContextFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :context, :string
  end
end
