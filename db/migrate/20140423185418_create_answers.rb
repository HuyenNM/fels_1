class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :option_id 
      t.integer :user_id 
      t.integer :lession_id 
      t.integer :word_id
      t.integer :category_id
      t.timestamps
    end
    add_index :answers, [:option_id, :user_id], unique:true
  end
end
