class Profile
  include Mongoid::Document
  include Mongoid::Versioning
  field :birthday, :type => Date
  embeds_one :name
  accepts_nested_attributes_for :name
  referenced_in :user
  validates_presence_of :user
  before_save :check_and_initialize_name
  protected
  def check_and_initialize_name
    self.create_name unless self.name
  end
end
