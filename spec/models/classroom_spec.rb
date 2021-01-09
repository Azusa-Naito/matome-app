require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'Classroom新規登録' do
    before do
      teacher = FactoryBot.create(:teacher)
      @classroom = FactoryBot.build(:classroom, teacher_id: teacher.id)
    end
    
    context 'Classroomが登録できるとき' do
      it 'name,year_month,teacher_idが存在すれば出品できる' do
        expect(@classroom).to be_valid
      end
    end

    context 'Classroomが登録できないとき' do
      it 'Teacherが紐づいていなければ出品できない' do
        @classroom.teacher_id = nil
        @classroom.valid?
        expect(@classroom.errors.full_messages).to include("Teacherを入力してください")
      end
      it 'nameが空では出品できない' do
        @classroom.name = nil
        @classroom.valid?
        expect(@classroom.errors.full_messages).to include("クラスの名前を入力してください")
      end
      it 'year_monthが空では出品できない' do
        @classroom.year_month = nil
        @classroom.valid?
        expect(@classroom.errors.full_messages).to include("学期を入力してください")
      end
    end
  end
end

