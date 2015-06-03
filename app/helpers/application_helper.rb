module ApplicationHelper
  def alert_type flash_type
    case flash_type
      when :success
        "alert-type-success"
      when :error
        "alert-type-danger"
      when :alert
        "alert-type-warning"
      when :notice
        "alert-type-info"
      else
        flash_type.to_s
    end
  end

  def icon_type flash_type
    case flash_type
      when :success
        "fa-exclamation-triangle"
      when :error
        "fa-exclamation-triangle"
      when :alert
        "fa-exclamation-triangle"
      when :notice
        "fa-exclamation-triangle"
      else
        flash_type.to_s
    end
  end

  def home?
    (params[:action] == "home" && params[:controller] == "providers")
  end

end
