class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :status
      t.string :character
      t.string :meaning
      t.integer :category_id
      t.timestamps
    end
  end

end
