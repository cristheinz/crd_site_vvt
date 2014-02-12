module ApplicationHelper
  
  def full_title(page_title)
    base_title = "Vou Viajar Turismo"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def category_map
    cmap=[
        ["Nao publicado", 0],
        ["Nacional",1],
        ["Internacional",2],
        ["Eventos", 3],
        ["Outros",4]
      ]
    return cmap
  end
  
  def get_category(id)
    category_map.each do |description, key|
      if key == id
        return description
      end
    end
  end
  
  def profile
    Profile.first
  end
  
end
