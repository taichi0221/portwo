class QuestionsController < ApplicationController

  require 'openai'


  def index
    
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    client = OpenAI::Client.new(api_key: ENV["OPENAI_API_KEY"])
    prompt = "言語は #{params[:question][:language]} です。"
    response = client.completions(
      engine: 'curie',
      prompt: prompt,
      max_tokens: 5
    )

    @generated_text = response.choices[0].text
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:language,:framework, :hobby, :former_job, :desired_engineer)
  end

end
