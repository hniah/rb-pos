module ProjectHelper
  def project_tag_links(tags)
    if tags.present?
      tags.split(',').map{|tag| link_to tag.capitalize, '#' }.join(', ').html_safe
    end
  end
  def resource_amazon_link(name)
    link_to(name, 'http://www.amazon.com/s/ref=nb_sb_noss_1?field-keywords='+name, target: '_blank').html_safe
  end
end
