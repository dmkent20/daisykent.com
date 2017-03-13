def admin_sign_in
  Admin.create!(email: "test@test.com", password: "test")
  visit 'admins/sign_in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'test'
  click_button 'Log in'
end
