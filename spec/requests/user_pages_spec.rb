require 'spec_helper'

describe "User pages" do

  subject { page }
  
  
  describe "index" do

      let(:user) { FactoryGirl.create(:user) }

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      before(:each) do
        sign_in user
        visit users_path
      end

     
end
 end
    
