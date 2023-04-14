require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @question = FactoryBot.build(:question, user_id: @user.id)
    
  end

  describe 'Question新規登録' do
    it 'languageが空では登録できない' do
      @question.language = ''
      @question.valid?
      expect(@question.errors.full_messages).to include "Language can't be blank"
    end
    it 'frameworkが空では登録できない' do
      @question.framework = ''
      @question.valid?
      expect(@question.errors.full_messages).to include "Framework can't be blank"
    end
    it 'hobbyが空では登録できない' do
      @question.hobby = ''
      @question.valid?
      expect(@question.errors.full_messages).to include "Hobby can't be blank"
    end
    it 'desired_engineerが空では登録できない' do
      @question.desired_engineer = ''
      @question.valid?
      expect(@question.errors.full_messages).to include "Desired engineer can't be blank"
    end
    it 'user_idが空では登録できない' do
      @question.user_id = ''
      @question.valid?
      expect(@question.errors.full_messages).to include "User must exist"
    end
    
  end
end