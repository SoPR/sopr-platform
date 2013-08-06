module ApplicationHelper

  def body_class
    [controller_name, action_name].join('-')
  end

  def bootstrap_class_for flash_type
    {
        success: 'alert-success',
        error: 'alert-error',
        alert: 'alert-block',
        notice: 'alert-info'
    }[flash_type] || flash_type.to_s
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
