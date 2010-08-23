class PublicProfile
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :birthday, :type => Date
  field :picture_path, :type => String
  field :thumb_path, :type => String
  referenced_in :profile

  def pending_friend?(profile)
    profile.pending_friends.include?(self)
  end

  def friend?(profile)
    profile.friends.include?(self)
  end

end
