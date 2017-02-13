class CreateQuestionChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :question_choices do |t|
      t.belongs_to :question, foreign_key: true
      t.belongs_to :creative_quality, foreign_key: true
      t.integer :score
      t.text :text

      t.timestamps
    end
  end
end
