class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :content
      t.integer :lession_id
      t.timestamps
    end
  end
end
