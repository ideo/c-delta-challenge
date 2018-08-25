class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question_choice, foreign_key: true
      t.belongs_to :survey_response, foreign_key: true

      t.timestamps
    end
  end
end
