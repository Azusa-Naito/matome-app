require 'rails_helper'

RSpec.describe Student, type: :model do 
  before do
    @student = FactoryBot.build(:student)
  end

  describe 'Student新規登録' do
    context 'Studentが登録ができるとき' do
      it 'student_number,name,name_k,nickname,image,email,password,password_confirmation,birthdayが存在すれば登録できる' do
        expect(@student).to be_valid
      end
      it 'パスワードが英数混合6文字以上であれば登録できる' do
        @student.password = 'aaa111'
        @student.password_confirmation = 'aaa111'
        expect(@student).to be_valid
      end
      it 'nameがアルファベットであれば登録できる' do
        @student.name = 'Abc Def'
        expect(@student).to be_valid
      end
      it 'name_kがカタカナであれば登録できる' do
        @student.name_k = 'カタカナ'
        expect(@student).to be_valid
      end
    end

    context 'Studentが登録ができないとき' do
      it 'student_numberが空では登録できない' do
        @student.student_number = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("学籍番号を入力してください")
      end
      it 'nameが空では登録できない' do
        @student.name = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("名前（alphabet）を入力してください")
      end
      it 'nameがアルファベット以外では登録できない' do
        @student.name = Gimei.last.kanji
        @student.valid?
        expect(@student.errors.full_messages).to include("名前（alphabet）はアルファベットのみで入力してください")
      end
      it 'name_kが空では登録できない' do
        @student.name_k = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("名前（カタカナ）を入力してください")
      end
      it 'name_kがカタカナ以外では登録できない' do
        @student.name_k = Gimei.last.kanji
        @student.valid?
        expect(@student.errors.full_messages).to include("名前（カタカナ）は全角カタカナのみで入力してください")
      end
      it 'nicknameが空では登録できない' do
        @student.nickname = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'imageが空では登録できない' do
        @student.image = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("画像を入力してください")
      end
      it 'emailが空では登録できない' do
        @student.email = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it '既に登録されているemailでは登録できない' do
        @student.save
        another_student = FactoryBot.build(:student)
        another_student.email = @student.email
        another_student.valid?
        expect(another_student.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'emailに@が含まれていないと登録できない' do
        @student.email = 'aaaaaa'
        @student.valid?
        expect(@student.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @student.password = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @student.password = '1a1a1'
        @student.password_confirmation = '1a1a1'
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが数字だけでは登録できない' do
        @student.password = '123456'
        @student.password_confirmation = '123456'
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードは半角英数字6文字以上で入力してください")
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @student.password = 'aaaaaa'
        @student.password_confirmation = 'aaaaaa'
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードは半角英数字6文字以上で入力してください")
      end
      it 'passwoed_confirmationが空では登録できない' do
        @student.password_confirmation = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワード（かくにん）とパスワードの入力が一致しません")
      end
      it 'password_confirmatiomがpasswordと同じでなければ登録できない' do
        @student.password = '111aaa'
        @student.password_confirmation = '1a1a1a'
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワード（かくにん）とパスワードの入力が一致しません")
      end
    end
  end
end
