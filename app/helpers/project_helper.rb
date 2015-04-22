module ProjectHelper

  def project_tag_links(tags)
    if tags.present?
      tags.split(',').map{|tag| link_to tag.capitalize, '#' }.join(', ').html_safe
    end
  end

  def resource_amazon_link(name)
    link_to(name, 'http://www.amazon.com/s/ref=nb_sb_noss_1?field-keywords='+name, target: '_blank').html_safe
  end

  def link_to_load_more_comment(comments, project_id)
    link_to_next_page(comments, 'Load More',params: {controller: 'comments', action: 'index', remote: true, project_id: project_id}, id: 'pagination').html_safe
  end

  def resource_freelancer_link(name)
    link_to(name, 'http://freelancer.com', target: '_blank').html_safe
  end

  def format_number_to_currency(cost)
    number_to_currency(cost, precision: 0)
  end

  def format_number_to_hours(hours)
    '%{hours} Hours' % {hours: number_with_delimiter(hours)}
  end

  def status_action_project(current_user, project)
    if current_user.present?
      if project.project_of?(current_user)
        return link_to('Edit project', edit_project_path(project), class: 'btn btn-success').html_safe
      elsif !WishList.existed?(current_user.id, project.id)
        return link_to('Add to my project', user_project_path(project), class: 'btn btn-success', method: :post).html_safe
      end
    end
    return ''
  end
end
