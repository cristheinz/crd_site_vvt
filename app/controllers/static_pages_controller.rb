class StaticPagesController < ApplicationController
  def home
    #@profile= Profile.first
    @images = ['img0.jpg','img1.jpg','img2.jpg']
    
    @pl=Pack.where('star = ? and category_id != ?', true, 0).take(3)
    @pr=Pack.where('promo = ? and category_id != ?', true, 0).take(3)
    @pb=Pack.where(category_id: 3).take(9)
  end

  def packages
    @packs=Pack.where('category_id != ?', 0)
  end

  def info
  end

  def news
    @feed = Feedzirra::Feed.fetch_and_parse("http://vidaeestilo.terra.com.br/rss/Controller?channelid=ddd26e40c5234310VgnVCM20000099f154d0RCRD&ctName=atomo-noticia&lg=pt-br")
  end

  def about
    #@profile= Profile.first
  end

  def contact
    #@profile= Profile.first
    #flash[:success] = "aaaaa".match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    if params[:visitor]
      #@name=params[:visitor][:name]
      #@message=params[:visitor][:message]
      @email=params[:visitor][:email]
      if @email.to_s.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
        ContactMailer.feedback_email(params[:visitor]).deliver
        ContactMailer.contact_email(params[:visitor]).deliver
        flash[:success] = "Obrigado!"
      else
        flash[:error] = "Email invalido."
      end
      redirect_to contact_path
      #flash[:success] = "Obrigado: #{params[:visitor]} ---> #{@name}, #{@email}, #{@message}"
    end
  end
end
