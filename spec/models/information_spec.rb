require 'rails_helper'

RSpec.describe Information, type: :model do
  describe 'Information新規登録' do
    before do
      teacher = FactoryBot.create(:teacher)
      @information = FactoryBot.build(:information, teacher_id: teacher.id)
    end
    
    context 'Informationが登録できるとき' do
      it 'title,genre_id,contentが存在すれば登録できる' do
        expect(@information).to be_valid
      end
    end

    context 'Informationが登録できないとき' do
      it 'Teacherが紐づいていなければ登録できない' do
        @information.teacher_id = nil
        @information.valid?
        expect(@information.errors.full_messages).to include("Teacherを入力してください")
      end
      it 'titleが空では登録できない' do
        @information.title = nil
        @information.valid?
        expect(@information.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'genre_idが1では登録できない' do
        @information.genre_id = 1
        @information.valid?
        expect(@information.errors.full_messages).to include("ジャンルを選択してください")
      end
      it 'contentが空では登録できない' do
        @information.content = nil
        @information.valid?
        expect(@information.errors.full_messages).to include("内容を入力してください")
      end
    end
  end
end
