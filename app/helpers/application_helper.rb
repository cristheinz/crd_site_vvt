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
        [t(:not_publish), 0],
        [t(:national),1],
        [t(:international),2],
        [t(:events), 3],
        [t(:others),4]
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
  
  def row_status(pack)
    if pack.category_id==0
      'error'
    else
      if pack.image.to_s.empty? || pack.pdf.to_s.empty?
        'warning'
      else
        'success'
      end
    end
  end
  
  def profile
    Profile.first
  end
  
end
