class CreateLessions < ActiveRecord::Migration
  def change
    create_table :lessions do |t|
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
