class ProfilesController < ApplicationController
  before_filter :signed_in

  def edit
    @profile = Profile.first
    #unless @profile
    #  @profile = Profile.new(name: 'Novo perfil')
    #  @profile.password = 'admin'
    #  @profile.password_confirmation = 'admin'
    #  @profile.save
    #end
  end

  def update
    #@profile = Profile.find(params[:id])
    @profile = Profile.first

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to edit_profile_path(@profile), notice: 'Os dados do perfil foram gravados com sucesso.' }
        #format.html { render action: "edit" , notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pack.errors, status: :unprocessable_entity }
      end
    end
  end

end
