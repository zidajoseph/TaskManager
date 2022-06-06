require 'rails_helper'
RSpec.describe 'User management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new user' do
      it 'The created user is displayed' do
        visit new_user_path
        fill_in 'Name', with: 'name_test'
        fill_in 'Email', with: 'mail_test@mail.com'
        fill_in 'Password', with: '12345678'
        fill_in 'Password confirmation', with: '12345678'
        click_on 'Create my account'
        expect(page).to have_content 'You are logged in'
      end
    end
  end
  describe 'Can not jump to the task list screen without logging' do
    context 'transition to the login screen' do
      it ' task list screen is not displayed' do
        visit tasks_path
        expect(page).to have_content 'Email'
      end
    end
  end
  describe 'Be able to log in' do
    let!(:user) { FactoryBot.create(:admin_user) }
    let!(:ordinary_user) { FactoryBot.create(:ordinary_user) }
    
    context 'transition to the login screen' do
      it ' login screen is displayed' do
        visit new_session_path
        fill_in 'Email', with: 'admin@example.com'
        fill_in 'Password', with: '123456'
        click_on 'Log in'
        expect(page).to have_content 'My tasks list'
        # expect(current_path).to eq user_path(id: user.id)
      end
    end

    context 'Connexion' do
        before do
            visit new_session_path
            fill_in "session[email]",with: "admin@example.com"
            fill_in "session[password]",with: "123456"
            click_on "Log in"
        end    
        it 'You can jump to your details screen (My page)' do
            click_on "Profile"
            expect(page).to have_content 'page of'
        end
        it 'When a general user jumps to another person s details screen, it will transition to the task list screen ' do
            visit user_path(id: ordinary_user.id)
            expect(page).to have_content 'access this page'
        end
        it 'Be able to log out' do
            click_on "Logout"
            expect(page).to have_content 'logged out'
        end
    end
  end

  describe 'Testez lécran de gestion.' do
    before do
        FactoryBot.create(:admin_user)
        FactoryBot.create(:admin_test)
        FactoryBot.create(:ordinary_user)
        visit new_session_path
    end
    context 'À partir de lécran de la liste des tâches.' do
      it 'Les utilisateurs administratifs ont accès à lécran de gestion.' do
        fill_in "session_email", with: "admin@example.com"
        fill_in "session_password", with: "123456"
        click_on "Log in"
        click_on "Management"
        expect(page).to have_content "General users list"
      end
      it 'Les utilisateurs généraux ne peuvent pas accéder à lécran de gestion.'do
        fill_in "session_email", with: "not_admin@example.com"
        fill_in "session_password", with: "123456"
        click_on "Log in"
        visit admin_users_path
        expect(page).to have_content "Can't access the administration page !"
      end
    end
    context 'A partir de lécran de la liste des utilisateurs.' do
      before do
        fill_in "session_email", with: "test@example.com"
        fill_in "session_password", with: "123456"
        click_on "Log in"
        visit admin_users_path
      end
      it 'Les utilisateurs administratifs peuvent enregistrer de nouveaux utilisateurs.' do
        click_on "New user"
        fill_in "Name", with: "cow"
        fill_in "Email", with: "mowmow@mow.com"
        fill_in "Password", with: "mowmow"
        fill_in "Password confirmation", with: "mowmow"
        click_on "Create new account"
        # click_on "登録する"
        expect(page).to have_content "User create succesfully"
      end
      it 'Les utilisateurs administratifs ont accès à lécran des détails de lutilisateur.' do
        click_on "Show",match: :first
        expect(page).to have_content "page of"
      end
      it 'Les utilisateurs administratifs peuvent modifier les utilisateurs à partir de lécran de modification de lutilisateur.' do
        click_on "edit",match: :first
        fill_in "Password", with: "mowmowmow"
        fill_in "Password confirmation", with: "mowmowmow"
        click_on "Edit account"
        expect(page).to have_content "User edited !"
      end
      it 'Les utilisateurs administratifs peuvent supprimer des utilisateurs.' do
        sleep 3.0
        click_on "delete",match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "User has been delete !"
      end
    end
  end

end