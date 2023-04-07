class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :index
  require 'ruby/openai'
  require 'rainbow'

  def index
    @users = User.all
    @user_count = User.count
  end
  
  def new
    @question = Question.new
  end

  def create
    require 'ruby/openai'

    @question = Question.new(question_params)
    @question.save
    client = OpenAI::Client.new(access_token:ENV["OPENAI_API_KEY"])

      response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: "Hello!" }],
      })
    
    #response.dig("choices", 0, "message", "content")
    #@messages = response.dig("choices", 0, "message", "content")
    @answer = Answer.new(answer: response.dig("choices", 0, "message", "content"), question: @question, user_id: current_user.id)
    @answer.save
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:language,:framework, :hobby, :former_job, :desired_engineer).merge(user_id: current_user.id)
  end

  def answer_params
    params.permit(:answer).merge(question_id: @question.id)
  end
end
