require "spec_helper"

describe "articles", :type => :feature do

	def article_data
	    { :title => "I contain a <script>-Tag", :description => "<script>alert('}:-(')</script>" }
	end

	it "must not contain unescaped <script> Tags index" do

		@a = Article.create!( article_data )
	    visit "/articles"
	    #expect(page).to contain_escaped("<script>alert('}:-(')</script>")
	    expect(page).to have_text( article_data["<script>alert('}:-(')</script>"] )

	end
end
