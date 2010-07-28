class PublicProfile
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :birthday, :type => Date
  field :picture_path, :type => String
  field :thumb_path, :type => String
  referenced_in :profile
  references_many :profiles, :stored_as => :array, :inverse_of => :friends, :class_name => 'Profile'
  references_many :pending_profiles, :stored_as => :array, :inverse_of => :pending_friends, :class_name => 'Profile'

end
