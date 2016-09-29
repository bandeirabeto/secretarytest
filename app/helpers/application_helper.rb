module ApplicationHelper
  def flash_message
    return "<div class='alert alert-danger'>#{alert}<a href='#' class='close'><span class='icon-close'></span></a></div>".html_safe   if alert
    return "<div class='alert alert-success'>#{notice}<a href='#' class='close'><span class='icon-close'></span></a></div>".html_safe if notice
  end
end
