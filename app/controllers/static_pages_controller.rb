class StaticPagesController < ApplicationController
  def home
    @images = ['img0.jpg','img1.jpg','img2.jpg','img3.jpg','img4.jpg','img5.jpg','img6.jpg']
    @pl=Pack.where('star = ? and category_id != ? and pdf!="" and image!=""', true, 0).take(3)
    @pr=Pack.where('promo = ? and category_id != ? and pdf!="" and image!=""', true, 0).take(3)
    @pb=Pack.where('category_id=? and pdf!="" and image!=""', 3).take(9)
  end

  def packages
    @packs=Pack.where('category_id != ? and pdf!="" and image!=""', 0)
  end

  def info
  end

  def news
    profile=Profile.first
    if profile && !profile.rss.empty?
      @feed = Feedzirra::Feed.fetch_and_parse(profile.rss)
    else
      @feed = Feedzirra::Feed.fetch_and_parse(view_context.default_rss)
    end
  end

  def about
  end

  def contact
    if params[:visitor]
      @email=params[:visitor][:email]
      if @email.to_s.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
        ContactMailer.feedback_email(params[:visitor]).deliver
        ContactMailer.contact_email(params[:visitor]).deliver
        flash[:success] = t(:thanks)
      else
        flash[:error] = t(:invalid_email)
      end
      redirect_to contact_path
    end
  end
end
