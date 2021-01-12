require 'rails_helper'

RSpec.describe "Student新規登録", type: :system do
  before do
    @student = FactoryBot.build(:student)
  end

  context 'Student新規登録ができるとき' do 
    it '正しい情報を入力すればStudent新規登録ができて、トップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページに講師ログインへ遷移するボタンがある
      expect(page).to have_content('学生はこちら')
      # 講師ログインページへ移動する
      visit new_student_session_path
      # 講師ログインページに新規登録ページへ遷移するボタンがある
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_student_registration_path
      # Student情報を入力する
      fill_in 'student-number', with: @student.student_number
      fill_in 'name', with: @student.name
      fill_in 'name-k', with: @student.name_k
      fill_in 'nickname', with: @student.nickname
      attach_file("student-image", File.join(Rails.root, 'spec/factories/test.png'), make_visible: true)
      find('select[name="student[birthday(1i)]"]').find("option[value='2000']").select_option
      find('select[name="student[birthday(2i)]"]').find("option[value='1']").select_option
      find('select[name="student[birthday(3i)]"]').find("option[value='1']").select_option
      fill_in 'email', with: @student.email
      fill_in 'password', with: @student.password
      fill_in 'password-confirmation', with: @student.password_confirmation
      # サインアップボタンを押すとStudentモデルのカウントが1上がる
      expect{find('input[name="commit"]').click}.to change { Student.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # カーソルを合わせるとログアウトボタンが表示される
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content('講師はこちら')
      expect(page).to have_no_content('学生はこちら')
      expect(page).to have_no_content('講師ゲストログイン')
      expect(page).to have_no_content('学生ゲストログイン')
    end
  end

  context '新規登録ができないとき' do
    it '誤った情報ではStudent新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに講師ログインへ遷移するボタンがある
      expect(page).to have_content('学生はこちら')
      # 講師ログインページへ移動する
      visit new_student_session_path
      # 講師ログインページに新規登録ページへ遷移するボタンがある
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_student_registration_path
      # Student情報を入力する
      fill_in 'student-number', with: ""
      fill_in 'name', with: ""
      fill_in 'name-k', with: ""
      fill_in 'nickname', with: ""
      attach_file("student-image", File.join(Rails.root, ''), make_visible: true)
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""
      # サインアップボタンを押してもStudentモデルのカウントは上がらない
      expect{find('input[name="commit"]').click}.to change { Student.count }.by(0)
      # 新規登録ページへ戻される
      expect(current_path).to eq "/students"
    end
  end
end

RSpec.describe 'Studentログイン', type: :system do
  before do
    @student = FactoryBot.create(:student)
  end
  context 'ログインができるとき' do
    it '保存されているStudentの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('学生はこちら')
      # ログインページへ遷移する
      visit new_student_session_path
      # 正しいStudent情報を入力する
      fill_in 'email', with: @student.email
      fill_in 'password', with: @student.password
      # ログインボタンを押す
      # binding.pry
      find('input[name="commit"]').click
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # カーソルを合わせるとログアウトボタンが表示される
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content('講師はこちら')
      expect(page).to have_no_content('学生はこちら')
      expect(page).to have_no_content('講師ゲストログイン')
      expect(page).to have_no_content('学生ゲストログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているStudentの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('学生はこちら')
      # ログインページへ遷移する
      visit new_student_session_path
      # Student情報を入力する
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻される
      expect(current_path).to eq new_student_session_path
    end
  end
end