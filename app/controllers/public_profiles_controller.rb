class PublicProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @public_profiles = PublicProfile.excludes(:profile_id => current_user.profile._id)
  end
  def search
    search_regular_expression = /#{params[:search]}/i
    @public_profiles = PublicProfile.find(:all, :conditions => {:name => search_regular_expression}).excludes(:profile_id => current_user.profile._id)
    respond_to do |format|
      format.js 
    end
  end
  def friend
    logger.debug("Param id #{params[:id]}")
    public_profile = PublicProfile.criteria.id(params[:id])
    if public_profile then
      current_user.profile.pending_friends << public_profile
    end
    @public_profiles = PublicProfile.find(:all, :conditions => {:name => search_regular_expression}).excludes(:profile_id => current_user.profile._id)
    respond_to do |format|
      format.js {render :action => "search"}
    end
  end
end
