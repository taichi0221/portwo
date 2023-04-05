class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string          :language,        null: false
      t.string          :framework,       null: false
      t.string          :hobby,           null: false
      t.string          :former_job
      t.string          :desired_engineer,null: false
      #t.references      :user,            null: false, foreign_key: true
      #t.references      :answer,            null: false, foreign_key: true
      


      t.timestamps
    end
  end
end
