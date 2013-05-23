require "spec_helper"

describe "Sign Up and Log In", :type => :feature do

  def user_data
      { :name => "the tester", :email => "foo@bar.com", :password => "1234567" }
  end
  def article_data
      { :title => "the title", :description => "this is a very important article" }
  end

  it "stranger can read articles" do
    @a = Article.create!( article_data )
    visit "/"
    expect(page).to have_text( article_data[:title] )
    expect(page).to have_text( article_data[:description] )
    expect(page).to_not have_link( "write new article", :href => new_article_path      )
    expect(page).to_not have_link( "Edit",                    :href => edit_article_path(@a) )
  end

  it "user can sign up, is logged in afterwards" do
    @a = Article.create!( article_data )
    visit "/"
    click_link "Sign up"
    fill_in "Name",     :with => user_data[:name]
    fill_in "Email",    :with => user_data[:email]
    fill_in "Password", :with => user_data[:password]
    click_button "Create User"
    expect(page).to have_text("User was successfully created")
    expect(page).to have_text("Logged in as")
    expect(page).to have_text( user_data[:name] )
    click_link "Article"
    expect(page).to have_link( "write new article", :href => new_article_path      )
    expect(page).to have_link( "Edit",                    :href => edit_article_path(@a) )
  end

  it "user can log in" do
    @u = User.create!( user_data )
    @a = Article.create!( article_data )
    visit "/"
    click_link "Log in"
    fill_in "Email",    :with => user_data[:email]
    fill_in "Password", :with => user_data[:password]
    click_button "Login"
    expect(page).to have_text("Logged in as")
    expect(page).to have_text( user_data[:name] )
    click_link "Article"
    expect(page).to have_link( "write new article", :href => new_article_path      )
    expect(page).to have_link( "Edit",                    :href => edit_article_path(@a) )
  end

  it "user cant see password" do
    visit "/"
    click_link "Sign up"
    fill_in "Name",     :with => user_data[:name]
    fill_in "Email",    :with => user_data[:email]
    fill_in "Password", :with => user_data[:password]
    expect(page).to have_field('Password', :type => "password") #schaut ob html field text oder password ist 
  end

end
