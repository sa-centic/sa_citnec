require 'rails_helper'

feature 'users' do
  let!(:role_admin) { create(:role, name: :admin) }
  let!(:role_moderator) { create(:role, :moderator) }
  let!(:role_courseholder) { create(:role, name: :courseholder) }
  let!(:role_courstaker) { create(:role, :coursetaker) }

  let!(:user_admin) { create(:user, :admin) }
  let!(:user_moderator) { create(:user, :moderator) }
  let!(:user_courseholder) { create(:user, :courseholder) }
  let!(:user_coursetaker) { create(:user, :coursetaker) }

  scenario 'Admin can delete admins' do
    delete_permitted(admin, admin)
  end

  scenario 'Admin can delete book keepers' do
    delete_permitted(admin, book_keeper)
  end

  scenario 'Admin can delete courses holder' do
    delete_permitted(admin, course_holder)
  end

  scenario 'Admin can delete attendants' do
    delete_permitted(admin, attendant)
  end

  scenario 'Book keepers can delete book keepers' do
    delete_permitted(book_keeper, book_keeper)
  end

  scenario 'Book keeper can delete courses holder' do
    delete_permitted(book_keeper, course_holder)
  end

  scenario 'Book keeper can delete attendant' do
    delete_permitted(book_keeper, attendant)
  end


  def delete_permitted(logged_in_as, type_to_delete)
    user_login_as logged_in_as
    expect(page).to have_content(I18n.t("activerecord.roles.#{type_to_delete.roles.first.name}"))
    find("##{type_to_delete.roles.first.name}").click
    expect(page.driver.browser.switch_to.alert.text).to have_content('Er du sikker?')
    page.driver.browser.switch_to.alert.accept
    if logged_in_as.equal?(type_to_delete)
      expect(page).to have_content(I18n.t('helpers.misc.log_in'))
      user_login_as logged_in_as
      expect(page).to have_content(I18n.t('devise.failure.invalid'))
    else
      expect(page).not_to have_content(I18n.t("activerecord.roles.#{type_to_delete.roles.first.name}"))
    end
  end


end