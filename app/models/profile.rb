require 'carrierwave/orm/mongoid'

class Profile
  include Mongoid::Document
  include Mongoid::Versioning
  field :birthday, :type => Date
  embeds_one :name
  accepts_nested_attributes_for :name
  referenced_in :user
  references_one :public_profile
  references_many :friends, :class_name => "PublicProfile", :stored_as => :array, :inverse_of => :profiles
  references_many :pending_friends, :class_name => "PublicProfile", :stored_as => :array, :inverse_of => :profiles
  validates_presence_of :user
  before_save :check_and_initialize_name, :create_public_profile

  mount_uploader :picture, AvatarUploader

  protected
  def check_and_initialize_name
    self.create_name unless self.name
  end

  def create_public_profile
    if self.public_profile.nil? then
      self.public_profile = PublicProfile.new(:name => self.name.full,
       :birthday => self.birthday,:profile => self)
    else
      self.public_profile.attributes =  {:name => self.name.full,
       :birthday => self.birthday}
    end
    if self.picture?
      self.public_profile.picture_path = self.picture.url
      self.public_profile.thumb_path = self.picture.thumb.url
    end
    self.public_profile.save
  end
end
