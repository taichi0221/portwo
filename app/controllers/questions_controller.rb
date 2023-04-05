class QuestionsController < ApplicationController

  require 'openai'


  def index
    
  end
  
  def new
    @question = Question.new
  end
  def create
    if params[:job_type].present?
      client = OpenAI::Client.new(api_key: ENV["OPENAI_API_KEY"])
      prompt = "私がなりたい職業は #{job_type} です"
      response = client.completions(
      
        engine: 'davinci',
        prompt: params[:prompt],
        max_tokens: 5
      )

      @generated_text = response.choices[0].text
    end
  end
end
