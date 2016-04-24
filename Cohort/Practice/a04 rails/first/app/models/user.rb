# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    if @user.nil?
      return nil
    else
      if @user.is_password?(password)
        @user
      else
        nil
      end
    end
  end

  def ensure_session_token
    self.reset_session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = self.password_digest
  end

  def reset_session_token
    self.session_token = User.generate_session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
