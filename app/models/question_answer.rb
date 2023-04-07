class QuestionAnswer
  include ActiveModel::Model
  attr_accessor :language, :framework, :hobby, :former_job, :desired_engineer, :user_id, :answer

  def save
    question = Question.create(language: language, framework: framework, former_job: former_job, desired_engineer: desired_engineer,hobby: hobby, user_id: user_id)

    Answer.create(answer: answer, question_id: question.id)


  end
end