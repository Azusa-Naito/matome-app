require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'Inquiry新規登録' do
    before do
      teacher = FactoryBot.create(:teacher)
      information = FactoryBot.create(:information, teacher_id: teacher.id)
      @inquiry = FactoryBot.build(:inquiry, information_id: information.id, teacher_id: teacher.id)
    end
    
    context 'Inquiryが登録できるとき' do
      it 'content,information_idが存在すれば登録できる' do
        expect(@inquiry).to be_valid
      end
    end

    context 'Inquiryが登録できないとき' do
      it 'Informationが紐づいていなければ登録できない' do
        @inquiry.information_id = nil
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Informationを入力してください")
      end
      it 'contentが空では登録できない' do
        @inquiry.content = nil
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("内容を入力してください")
      end
    end
  end
end
