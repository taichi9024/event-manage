class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :place
      t.datetime :start_time
      t.datetime :end_time
      t.text :content

      t.timestamps
    end
  end
end
