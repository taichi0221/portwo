class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :index
  require 'openai'


  def index
    @answer = session.delete(:answer)
  end
  
  def new
    @question_answer = QuestionAnswer.new
  end

  def create
    @question_answer = QuestionAnswer.new(question_params)
    client = OpenAI::Client.new(api_key: ENV["OPENAI_API_KEY"])
    prompt = "言語は #{params[:question][:language]} です。"
    response = client.completions(
      engine: 'curie',
      prompt: prompt,
      max_tokens: 5
    )
    answer = response.choices[0].text
    @question_answer.save
    redirect_to root_path
    # @answer = Answer.new(answer: response.choices[0].text, question: @question, user_id: current_user.id)
    # @answer.save
    # redirect_to root_path
  end

  private

  def question_params
    params.require(:question_answer).permit(:language,:framework, :hobby, :former_job, :desired_engineer).merge(user_id: current_user.id)
  end

  # def answer_params
  #   params.permit(:answer).merge(question_id: @question.id)
  # end
end
