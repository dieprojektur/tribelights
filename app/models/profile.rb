class Profile
  include Mongoid::Document
  include Mongoid::Versioning
  field :birthday, :type => Date
  embeds_one :name
  accepts_nested_attributes_for :name
  referenced_in :user
  references_one :public_profile
  #after_save :create_public_profile
  validates_presence_of :user
  before_save :check_and_initialize_name

  protected
  def check_and_initialize_name
    self.create_name unless self.name
  end

  def create_public_profile
    if self.public_profile.nil? then
      self.public_profile = PublicProfile.create(:name => self.name.full,
       :birthday => self.birthday, :profile => self)
    else
      self.public_profile.attributes =  {:name => self.name.full,
       :birthday => self.birthday}
      self.public_profile.save
    end
  end
end
