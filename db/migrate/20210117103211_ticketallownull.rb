class Ticketallownull < ActiveRecord::Migration[6.1]
  def up
    change_column :tickets, :user_id, :integer,null: true
  end

  def down
    change_column :tickets, :user_id, :integer
  end
end
