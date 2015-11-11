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
  
  def pdf_image_tag(image_name)
    if Rails.env.development? || Rails.env.test?
      # Unless running a web server that can process 2 requests at the same
      # time, trying to insert an image in a PDF creates a deadlock: the server
      # can't finish processing the PDF request until it gets the image, but it
      # can't start processing the image request until it has finished
      # processing the PDF request.
      # This will not be a problem in production, but in dev, a workaround is
      # to base64 the image and insert its contents into the HTML
      image_data = Rails.application.assets[image_name].to_s
      image_tag "data:image/png;base64,#{::Base64.encode64(image_data)}"
    else
      image_tag image_name
    end
  end

end
