class Eventallownull < ActiveRecord::Migration[6.1]
  def up
    change_column :events, :user_id, :integer, null: true
  end

  def down
    change_column :events, :user_id, :integer
  end
end
