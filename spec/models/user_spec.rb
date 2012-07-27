# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
require 'spec_helper'

describe User do

  before do
      @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should be_valid }
  it { should respond_to(:admin) }
  it { should_not be_admin }
  it { should respond_to(:microposts) }
  it { should respond_to(:feed) }
    describe "micropost associations" do

        before { @user.save }
        let!(:older_micropost) do 
          FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
        end
        let!(:newer_micropost) do
          FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
        end
        .
        .
        .
        describe "status" do
          let(:unfollowed_post) do
            FactoryGirl.create(:micropost, user: FactoryGirl.create(:user))
          end

          its(:feed) { should include(newer_micropost) }
          its(:feed) { should include(older_micropost) }
          its(:feed) { should_not include(unfollowed_post) }
        end
      end
    
end