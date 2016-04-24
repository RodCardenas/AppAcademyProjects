# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nickname        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe "User", :type => :model do
  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(nickname: "jack_bruce", password: "abcdef")
      user = User.find_by_nickname("jack_bruce")
      expect(user.password).not_to be("abcdef")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(nickname: "jack_bruce", password: "abcdef")
    end
  end
end
