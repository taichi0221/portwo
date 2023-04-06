class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :question,    null: false, foreign_key: true
      t.text :answer,   null: false
      t.timestamps
    end
  end
end
