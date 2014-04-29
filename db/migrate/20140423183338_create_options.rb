class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :word_id
      t.string :text
      t.boolean :is_correct, :default => false
      t.timestamps
    end
  end
end
 