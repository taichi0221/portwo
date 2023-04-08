class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :index
  require 'ruby/openai'
  require 'rainbow'

  def index
    @user_count = User.count
    @question_count = Question.count
    if user_signed_in? && current_user.questions.exists?
      @question = current_user.questions.last
      @answer = @question.answer
    end

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
          messages: [{ role: "user", content: "hello!" }],
          max_tokens: 10
          #messages: [{ role: "user", content: "あなたは優秀なキャリアアドバイザーです。私はエンジニアになりたいです。私の得意なプログラミング言語は#{params[:question][:language]}、フレームワークは#{params[:question][:framework]}です。趣味は#{params[:question][:hobby]}、前職は#{params[:question][:former_job]}です。#{params[:question][:desired_engineer]}になりたいです。作れば良いポートフォリオ案を簡潔に１個ください。" }],
          #max_tokens: 240
      })
    
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
