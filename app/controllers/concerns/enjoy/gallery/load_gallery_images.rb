module Enjoy::Gallery::LoadGalleryImages
  extend ActiveSupport::Concern


  def enjoy_gallery_render_gallery_images
    @gallery_images = enjoy_gallery_load_gallery_images

    render_opts = {
      layout:   enjoy_gallery_gallery_images_layout,
      action:   enjoy_gallery_gallery_images_action,
      partial:  enjoy_gallery_gallery_images_partial
    }
    render render_opts.compact
  end

  private

  def enjoy_gallery_gallery_images_layout
    request.xhr? ? false : 'application'
  end

  def enjoy_gallery_gallery_images_action
    'enjoy_gallery_render_gallery_images'
  end

  def enjoy_gallery_gallery_images_partial
    nil
  end

  def enjoy_gallery_gallery_image_class
    Enjoy::Gallery::Image
  end

  def enjoy_gallery_load_gallery_images
    enjoy_gallery_gallery_image_class.enabled.sorted.page(params[:page]).per(enjoy_gallery_gallery_images_per_page)
  end

  def enjoy_gallery_gallery_images_per_page
    4
  end



end
