class PublicProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @public_profiles = PublicProfile.excludes(:profile_id => current_user.profile._id)
  end
  def search
    re = /#{params[:search]}/
    @public_profiles = PublicProfile.find(:all, :conditions => {:name => re})
    logger.debug @public_profiles
    logger.debug @public_profiles.count
    respond_to do |format|
      format.js 
    end
  end
  def friend
    public_profile = PublicProfiles.id(params[:id])
    if public_profile then
      current.user.profile.friends << public_profile
    end
    respond_to do |format|
      format.js
    end
  end
end
