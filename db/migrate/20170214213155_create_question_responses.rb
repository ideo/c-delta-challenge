class CreateQuestionResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :question_responses do |t|
      t.belongs_to :question_choice, foreign_key: true
      t.belongs_to :response, foreign_key: true

      t.timestamps
    end
  end
end
