class PublicProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @public_profiles = PublicProfile.all
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
end
