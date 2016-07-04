Enjoy.rails_admin_configure do |config|
  config.action_visible_for :nested_set, 'Enjoy::Gallery::Gallery'
  config.action_visible_for :nested_set, 'Enjoy::Gallery::Image'

  if defined?(RailsAdminComments)
    config.action_visible_for :comments, 'Enjoy::Gallery::Gallery'
    config.action_visible_for :comments, 'Enjoy::Gallery::Image'

    config.action_visible_for :model_comments, 'Enjoy::Gallery::Gallery'
    config.action_visible_for :model_comments, 'Enjoy::Gallery::Image'
  end

  if defined?(RailsAdminMultipleFileUpload)
    if true or Enjoy::Catalog.active_record?
      config.action_visible_for :multiple_file_upload, 'Enjoy::Gallery::Gallery'
    end
  end
end

Enjoy.configure do |config|
  config.ability_manager_config << {
    method: :can,
    model: Enjoy::Gallery::Gallery,
    actions: [:edit, :update, :new]
  }
  config.ability_manager_config << {
    method: :can,
    model: Enjoy::Gallery::Image,
    actions: [:edit, :update, :new, :nested_set]
  }
  config.ability_admin_config << {
    method: :can,
    model: Enjoy::Gallery::Gallery,
    actions: :manage
  }
  config.ability_admin_config << {
    method: :can,
    model: Enjoy::Gallery::Image,
    actions: :manage
  }
end

if defined?(RailsAdmin)
  RailsAdmin.config do |config|
    config.excluded_models ||= []
    config.excluded_models << [
      'Enjoy::Gallery::EmbeddedImage'
    ]
    config.excluded_models.flatten!
  end
end
