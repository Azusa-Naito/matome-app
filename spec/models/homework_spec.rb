require 'rails_helper'

RSpec.describe Homework, type: :model do
  describe 'Homework新規登録' do
    before do
      teacher = FactoryBot.create(:teacher)
      classroom = FactoryBot.create(:classroom, teacher_id: teacher.id)
      @homework = FactoryBot.build(:homework, teacher_id: teacher.id, classroom_id: classroom.id)
    end
    context 'Homeworkが登録できるとき' do
      it 'start_time, content, judgement, classroom_idが存在すれば登録できる' do
        expect(@homework).to be_valid
      end
    end

    context 'Homeworkが登録できないとき' do
      it 'Classroomが紐づいていなければ登録できない' do
        @homework.classroom_id = nil
        @homework.valid?
        expect(@homework.errors.full_messages).to include("Classroomを入力してください")
      end
      it 'start_timeが空では登録できない' do
        @homework.start_time = nil
        @homework.valid?
        expect(@homework.errors.full_messages).to include("Start timeを入力してください")
      end
      it 'contentが空では登録できない' do
        @homework.content = nil
        @homework.valid?
        expect(@homework.errors.full_messages).to include("宿題内容を入力してください")
      end
      it 'judgementが空では登録できない' do
        @homework.judgement = nil
        @homework.valid?
        expect(@homework.errors.full_messages).to include("Judgementを入力してください")
      end
    end
  end
end
