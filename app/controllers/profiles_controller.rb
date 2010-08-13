class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  # GET /user/profile
  # GET /user/profile.xml
  def show
    @profile = current_user.profile

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end


  # GET /user/profile/edit
  def edit
    @profile = current_user.profile
  end


  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = current_user.profile

    respond_to do |format|
      logger.debug 'updating'
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(profile_url, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

end
