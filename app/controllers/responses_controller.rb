class ResponsesController < ApplicationController
  def show
    @response = Response
      .includes(question_responses: [question_choice: [question: :choices]])
      .find(params[:id])
  end

  def index
    @responses = Response.all
  end
end
