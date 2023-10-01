module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type)
    unless flash[type].blank?
      content_tag :p, flash[type], class: 'flash #{type}'
    end
  end
end
