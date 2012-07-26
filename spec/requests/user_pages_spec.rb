require 'spec_helper'

describe "User pages" do

  subject { page }
  
  
  describe "profile page" do
      let(:user) { FactoryGirl.create(:user) }
      let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
      let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

      before { visit user_path(user) }

      it { should have_selector('h1',    text: user.name) }
      it { should have_selector('title', text: user.name) }

      describe "microposts" do
        it { should have_content(m1.content) }
        it { should have_content(m2.content) }
        it { should have_content(user.microposts.count) }
      end
    end
      
      
   
     
  end
end
    
