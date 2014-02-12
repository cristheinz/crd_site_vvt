class ProfilesController < ApplicationController
  before_filter :signed_in

  def edit
    @profile = Profile.first
  end

  def update
    @profile = Profile.first

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to edit_profile_path(@profile), notice: t(:profile_saved) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pack.errors, status: :unprocessable_entity }
      end
    end
  end

end
