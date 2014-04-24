class CreateLessionWords < ActiveRecord::Migration
  def change
    create_table :lession_words do |t|
      t.integer :lession_id
      t.integer :word_id

      t.timestamps
    end
    add_index :lession_words, [:lession_id, :word_id], unique:true
  end
end
