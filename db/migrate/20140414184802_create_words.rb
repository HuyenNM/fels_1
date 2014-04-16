class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :status
      t.string :character
      t.string :meaning
      t.integer :categoryID
      t.timestamps
    end
  end

end
