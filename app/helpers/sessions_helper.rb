module SessionsHelper
  def sign_in(user)
    self.current_user = user
    session[:remember_me] = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= session[:remember_me]
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    self.current_user = nil
    session.delete(:remember_me)
  end
  
  def signed_in
    unless signed_in?
      redirect_to root_path
    end
  end
  
end
