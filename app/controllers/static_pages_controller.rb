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
    if params[:cambi]
      val= params[:cambi][:val]
      from = params[:cambi][:from] 
      to = params[:cambi][:to]
      r=0
      if(from!=to && !val.empty?)
        client = Savon.client(wsdl: "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL")
        response = client.call( :conversion_rate,  message:  { "FromCurrency"=> from, "ToCurrency"=> to })
        t = response.body.to_hash[:conversion_rate_response][:conversion_rate_result]
        #t= 0.5
        r = +val.to_f * t.to_f
        ft = view_context.number_to_currency(t, unit: to, separator: ",", delimiter: " ", format: "%n %u")
        fval = view_context.number_to_currency(val, unit: from, separator: ",", delimiter: " ", format: "%n %u")
        fr = view_context.number_to_currency(r, unit: to, separator: ",", delimiter: " ", format: "%n %u")
        #@data="1 #{from} vale #{ft}. Assim, <strong>#{fval}</strong> corresponde a <strong>#{fr}</strong>."
        @data = view_context.t(:cambi_msg0, from: from, ft: ft, fval: fval, fr: fr)
        @status="success" 
      else
        @data=t(:cambi_msg1)
        @data=t(:cambi_msg2) if val.empty?
        @status="warning"
      end
      
      respond_to do |format|
        format.html { render 'info' }
        format.js
      end
    end
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
        #ContactMailer.feedback_email(params[:visitor]).deliver
        ContactMailer.contact_email(params[:visitor]).deliver
        flash[:success] = t(:thanks)
      else
        flash[:error] = t(:invalid_email)
      end
      redirect_to contact_path
    end
  end
end
