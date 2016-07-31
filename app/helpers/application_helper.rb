module ApplicationHelper
  def active_for(controller_name)
    params[:controller].to_s == controller_name.to_s ? 'active' : ''
  end
end
