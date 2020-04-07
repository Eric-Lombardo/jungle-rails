class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 2 }
  validates :password_confirmation, presence: true
  validates :password, inclusion: { in: ->(user) { [user.password_confirmation] } }

  before_validation :strip_whitespace, :only => [:email]
  before_validation :downcase_email, :only => [:email]

  private

  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
  end

  def downcase_email
    self.email = self.email.downcase unless self.email.nil?
  end
end
