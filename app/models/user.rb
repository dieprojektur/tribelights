class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  references_one :profile

  before_save :check_or_create_empty_profile

  private 
  def check_or_create_empty_profile
    self.profile = Profile.create if self.profile.nil?
  end

end
