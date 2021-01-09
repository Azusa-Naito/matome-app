require 'rails_helper'

RSpec.describe Teacher, type: :model do
  before do
    @teacher = FactoryBot.build(:teacher)
  end

  describe 'Teacher新規登録' do
    context 'Teacherが登録ができるとき' do
      it 'employee_number,status_id,last_name,first_name,last_name_k,first_name_k,image,email,password,password_confirmation,nicknameが存在すれば登録できる' do
        expect(@teacher).to be_valid
      end
      it 'パスワードが英数混合6文字以上であれば登録できる' do
        @teacher.password = 'aaa111'
        @teacher.password_confirmation = 'aaa111'
        expect(@teacher).to be_valid
      end
      it 'last_name,first_nameが漢字・ひらがな・カタカナであれば登録できる' do
        @teacher.last_name = 'あア亜'
        @teacher.first_name = 'あア亜'
        expect(@teacher).to be_valid
      end
      it 'last_name_k,first_name_kがカタカナであれば登録できる' do
        @teacher.last_name_k = 'カタカナ'
        @teacher.first_name_k = 'カタカナ'
        expect(@teacher).to be_valid
      end
    end

    context 'Teacherが登録ができないとき' do
      it 'employee_numberが空では登録できない' do
        @teacher.employee_number = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("社員番号を入力してください")
      end
      it 'status_idが1では登録できない' do
        @teacher.status_id = 1
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("雇用形態を選択してください")
      end
      it 'last_nameが空では登録できない' do
        @teacher.last_name = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("姓を入力してください")
      end
      it 'last_nameがアルファベットでは登録できない' do
        @teacher.last_name = "ABC"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("姓は全角文字を使用してください")
      end
      it 'first_nameが空では登録できない' do
        @teacher.first_name = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("名を入力してください")
      end
      it 'first_nameがアルファベットでは登録できない' do
        @teacher.first_name = "ABC"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("名は全角文字を使用してください")
      end
      it 'last_name_kが空では登録できない' do
        @teacher.last_name_k = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("姓（カタカナ）を入力してください")
      end
      it 'last_name_kがカタカナ以外では登録できない' do
        @teacher.last_name_k = Gimei.last.kanji
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("姓（カタカナ）は全角カタカナのみで入力してください")
      end
      it 'first_name_kが空では登録できない' do
        @teacher.first_name_k = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("名（カタカナ）を入力してください")
      end
      it 'first_name_kがカタカナ以外では登録できない' do
        @teacher.first_name_k = Gimei.first.kanji
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("名（カタカナ）は全角カタカナのみで入力してください")
      end
      it 'imageが空では登録できない' do
        @teacher.image = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("画像を入力してください")
      end
      it 'emailが空では登録できない' do
        @teacher.email = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it '既に登録されているemailでは登録できない' do
        @teacher.save
        another_teacher = FactoryBot.build(:teacher)
        another_teacher.email = @teacher.email
        another_teacher.valid?
        expect(another_teacher.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'emailに@が含まれていないと登録できない' do
        @teacher.email = 'aaaaaa'
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @teacher.password = ''
        @teacher.password_confirmation = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @teacher.password = '1a1a1'
        @teacher.password_confirmation = '1a1a1'
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが数字だけでは登録できない' do
        @teacher.password = '123456'
        @teacher.password_confirmation = '123456'
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードは半角英数字6文字以上で入力してください")
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @teacher.password = 'aaaaaa'
        @teacher.password_confirmation = 'aaaaaa'
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードは半角英数字6文字以上で入力してください")
      end
      it 'passwoed_confirmationが空では登録できない' do
        @teacher.password_confirmation = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'password_confirmatiomがpasswordと同じでなければ登録できない' do
        @teacher.password = '111aaa'
        @teacher.password_confirmation = '1a1a1a'
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'nicknameが空では登録できない' do
        @teacher.nickname = ''
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("ニックネームを入力してください")
      end
    end
  end
end
