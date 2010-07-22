class PublicProfile
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :birthday, :type => Date
  field :picture_path, :type => String
  field :thumb_path, :type => String
  referenced_in :profile

end
