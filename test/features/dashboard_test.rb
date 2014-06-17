require "test_helper"

class DashboardTest < Capybara::Rails::TestCase
  test "Dashboard displays all artists for the shop" do
    shop = sign_in
    shop.artists.create(name: "Jason Angst")

    visit dashboard_path
 
    page.must_have_content "Jason Angst"
  end
end
