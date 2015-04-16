module UserHelper
  def user_tag_links(tags)
    if tags.present?
      tags.split(',').map{|tag| link_to tag.capitalize, '#' }.join(', ').html_safe
    end
  end
end
