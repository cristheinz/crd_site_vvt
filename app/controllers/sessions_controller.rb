class SessionsController < ApplicationController
  def new
  end

  def create
    profile = Profile.first
    unless profile
      profile = Profile.new(name: 'admin')
      profile.password = 'admin'
      profile.password_confirmation = 'admin'
      profile.save
    end 
    
    if profile && profile.authenticate(params[:session][:password])
    #if params[:session][:password]=="aaa"
      #sign_in 'admin'
      sign_in profile
      redirect_to packs_path
    else
      flash.now[:error] = 'Password invalida'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
