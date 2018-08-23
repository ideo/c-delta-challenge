class SurveyResponsesController < ApplicationController
  def show
    @response = SurveyResponse
                .includes(
                  answers: [
                    question_choice: [
                      question: :question_choices
                    ]
                  ]
                )
                .find(params[:id])
  end

  def index
    @responses = SurveyResponse.all
  end
end
