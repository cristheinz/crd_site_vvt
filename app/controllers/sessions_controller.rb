class SessionsController < ApplicationController
  def new
  end

  def create
    profile = Profile.first
    
    if profile && profile.authenticate(params[:session][:password])
      sign_in profile
      redirect_to packs_path
    else
      flash.now[:error] = t(:invalid_password)
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
