class QuestionsController < ApplicationController
  def show
    @question = Question.includes(:choices).find(params[:id])
  end

  def index
    @questions = Question.order(:id)
  end
end
