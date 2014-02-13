class Profile < ActiveRecord::Base
  attr_accessible :rss, :keywords, :description, :about, :addr1, :addr2, :att, :email, :mission, :msg1, :msg2, :name, :pillars, :tel1, :tel2, :tel3, :title, :password, :password_confirmation
  has_secure_password
end
