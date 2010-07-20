class PublicProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @public_profiles = PublicProfile.all
  end
end
