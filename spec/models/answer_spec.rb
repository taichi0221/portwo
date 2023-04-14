require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @question = FactoryBot.create(:question)
    @answer = FactoryBot.build(:answer, user_id: @user.id, question_id: @question.id)
  end

  describe 'answer新規登録' do
    it 'answerが空では登録できない' do
      @answer.answer = ''
      @answer.valid?
      expect(@answer.errors.full_messages).to include "Answer can't be blank"
    end
    it 'user_idが空では登録できない' do
      @answer.user_id = ''
      @answer.valid?
      expect(@answer.errors.full_messages).to include "User must exist"
    end
    it 'question_idが空では登録できない' do
      @answer.question_id = ''
      @answer.valid?
      expect(@answer.errors.full_messages).to include "Question must exist"
    end
  end

  
end
