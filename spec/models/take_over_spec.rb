require 'rails_helper'

RSpec.describe TakeOver, type: :model do
  describe 'Takeover新規登録' do
    before do
      teacher = FactoryBot.create(:teacher)
      classroom = FactoryBot.create(:classroom, teacher_id: teacher.id)
      @take_over = FactoryBot.build(:take_over, teacher_id: teacher.id, classroom_id: classroom.id)
    end
    context 'Takeoverが登録できるとき' do
      it 'start_time,content,detail,appearance,judgement,classroom_id,teacher_idが存在すれば登録できる' do
        expect(@take_over).to be_valid
      end
    end

    context 'Takeoverが登録できないとき' do
      it 'Classroomが紐づいていなければ登録できない' do
        @take_over.classroom_id = nil
        @take_over.valid?
        expect(@take_over.errors.full_messages).to include("Classroomを入力してください")
      end
      it 'Teacherが紐づいていなければ登録できない' do
        @take_over.teacher_id = nil
        @take_over.valid?
        expect(@take_over.errors.full_messages).to include("Teacherを入力してください")
      end
      it 'start_timeが空では登録できない' do
        @take_over.start_time = nil
        @take_over.valid?
        expect(@take_over.errors.full_messages).to include("Start timeを入力してください")
      end
      it 'contentが空では登録できない' do
        @take_over.content = nil
        @take_over.valid?
        expect(@take_over.errors.full_messages).to include("授業範囲を入力してください")
      end
      it 'detailが空では登録できない' do
        @take_over.detail = nil
        @take_over.valid?
        expect(@take_over.errors.full_messages).to include("授業内容を入力してください")
      end
      it 'appearanceが空では登録できない' do
        @take_over.appearance = nil
        @take_over.valid?
        expect(@take_over.errors.full_messages).to include("学生の様子を入力してください")
      end
      it 'judgementが空では登録できない' do
        @take_over.judgement = nil
        @take_over.valid?
        expect(@take_over.errors.full_messages).to include("Judgementを入力してください")
      end
    end
  end
end
