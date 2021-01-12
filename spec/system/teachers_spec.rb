require 'rails_helper'

RSpec.describe "Teacher新規登録", type: :system do
  before do
    @teacher = FactoryBot.build(:teacher)
  end

  context 'Teacher新規登録ができるとき' do 
    it '正しい情報を入力すればTeacher新規登録ができて、トップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページに講師ログインへ遷移するボタンがある
      expect(page).to have_content('講師はこちら')
      # 講師ログインページへ移動する
      visit new_teacher_session_path
      # 講師ログインページに新規登録ページへ遷移するボタンがある
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_teacher_registration_path
      # Teacher情報を入力する
      fill_in 'employee-number', with: @teacher.employee_number
      find("#status").find("option[value='2']").select_option
      fill_in 'last-name', with: @teacher.last_name
      fill_in 'first-name', with: @teacher.first_name
      fill_in 'last-name-k', with: @teacher.last_name_k
      fill_in 'first-name-k', with: @teacher.first_name_k
      attach_file("teacher-image", File.join(Rails.root, 'spec/factories/test.png'), make_visible: true)
      fill_in 'nickname', with: @teacher.nickname
      fill_in 'email', with: @teacher.email
      fill_in 'password', with: @teacher.password
      fill_in 'password-confirmation', with: @teacher.password_confirmation
      # サインアップボタンを押すとTeacherモデルのカウントが1上がる
      binding.pry
      expect{find('input[name="commit"]').click}.to change { Teacher.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # カーソルを合わせるとログアウトボタンが表示される
      expect(page).to have_content('ログアウト')
      # expect(
      #   find(".nav_item").find("nav-link").hover
      # ).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content('講師はこちら')
      expect(page).to have_no_content('学生はこちら')
      expect(page).to have_no_content('講師ゲストログイン')
      expect(page).to have_no_content('学生ゲストログイン')
    end
  end

  context '新規登録ができないとき' do
    it '誤った情報ではTeacher新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに講師ログインへ遷移するボタンがある
      expect(page).to have_content('講師はこちら')
      # 講師ログインページへ移動する
      visit new_teacher_session_path
      # 講師ログインページに新規登録ページへ遷移するボタンがある
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_teacher_registration_path
      # Teacher情報を入力する
      fill_in 'employee-number', with: ""
      find("#status").find("option[value='1']").select_option
      fill_in 'last-name', with: ""
      fill_in 'first-name', with: ""
      fill_in 'last-name-k', with: ""
      fill_in 'first-name-k', with: ""
      attach_file("teacher-image", File.join(Rails.root, ''), make_visible: true)
      fill_in 'nickname', with: ""
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""
      # サインアップボタンを押してもTeacherモデルのカウントは上がらない
      expect{find('input[name="commit"]').click}.to change { Teacher.count }.by(0)
      # 新規登録ページへ戻される
      expect(current_path).to eq "/teachers"
    end
  end
end

RSpec.describe 'Teacherログイン', type: :system do
  before do
    @teacher = FactoryBot.create(:teacher)
  end
  context 'ログインができるとき' do
    it '保存されているTeacherの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('講師はこちら')
      # ログインページへ遷移する
      visit new_teacher_session_path
      # 正しいTeacher情報を入力する
      fill_in 'email', with: @teacher.email
      fill_in 'password', with: @teacher.password
      binding.pry
      # ログインボタンを押す
      find(".submit").click
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
    it '保存されているTeacherの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('講師はこちら')
      # ログインページへ遷移する
      visit new_teacher_session_path
      # Teacher情報を入力する
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      # ログインボタンを押す
      find(".submit").click
      # ログインページへ戻される
      expect(current_path).to eq new_teacher_session_path
    end
  end
end