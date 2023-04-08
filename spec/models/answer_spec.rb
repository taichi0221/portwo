require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @answer = FactoryBot.build(:answer)
  end

  describe 'answer新規登録' do
    it 'answerが空では登録できない' do
      @answer.answer = ''
      @answer.valid?
      expect(@answer.errors.full_messages).to include "Answer can't be blank"
    end
  end

  
end
