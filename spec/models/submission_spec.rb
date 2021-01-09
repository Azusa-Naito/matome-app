require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'Submission新規登録' do
    before do
      teacher = FactoryBot.create(:teacher)
      classroom = FactoryBot.create(:classroom, teacher_id: teacher.id)
      homework = FactoryBot.create(:homework, teacher_id: teacher.id, classroom_id: classroom.id)
      student = FactoryBot.create(:student)
      @submission = FactoryBot.build(:submission, homework_id: homework.id, student_id: student.id)
    end
    
    context 'Submissionが登録できるとき' do
      it 'content,information_idが存在すれば登録できる' do
        expect(@submission).to be_valid
      end
    end

    context 'Submissionが登録できないとき' do
      it 'Homeworkが紐づいていなければ登録できない' do
        @submission.homework_id = nil
        @submission.valid?
        expect(@submission.errors.full_messages).to include("Homeworkを入力してください")
      end
      it 'contentが空では登録できない' do
        @submission.content = nil
        @submission.valid?
        expect(@submission.errors.full_messages).to include("内容を入力してください")
      end
    end
  end
end
