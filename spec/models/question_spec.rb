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
  end
end