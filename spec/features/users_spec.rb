require "spec_helper"

describe "Users", :type => :feature do

  describe "are listed publicly" do

    it "shows name and e-mail" do
      u = User.create!({ :name => 'noob', :email => 'foo@bar.com', :password => 'secret'})
      visit "/users"
      page.body.should have_text('noob')
      page.body.should have_text('foo@bar.com')
    end

    it "page does NOT show password" do
      u = User.create!({ :name => 'noob', :email => 'foo@bar.com', :password => 'secret'})
      visit "/users"
      page.body.should_not have_text('secret')
    end

  end

  describe "create a user" do

    it "not without e-mail" do
      visit "/users/new"

      fill_in "Name",     :with => 'noob'
      fill_in "Email",    :with => ''
      fill_in "Password", :with => 'secret'
      click_button "Create User"

      u = User.find_by_email('foo@bar.com')
      u.should be_nil
    end

    it "works" do
      visit "/users/new"

      fill_in "Name",     :with => 'noob'
      fill_in "Email",    :with => 'foo@bar.com'
      fill_in "Password", :with => 'secret'
     click_button "Create User"

      u = User.find_by_email('foo@bar.com')
      u.should_not be_nil
      u.name.should == 'noob'
    end

  end
end
