module Enjoy::Gallery::LoadGalleryImages
  extend ActiveSupport::Concern


  def enjoy_gallery_render_gallery
    @gallery = enjoy_gallery_load_gallery
    @gallery_images = enjoy_gallery_gallery_load_images

    @next_page = (params[:page] || 1).to_i + 1

    render_opts = {
      layout:   enjoy_gallery_gallery_layout,
      action:   enjoy_gallery_gallery_action,
      partial:  enjoy_gallery_gallery_partial
    }
    render render_opts.compact
  end

  private


  def enjoy_gallery_gallery_layout
    request.xhr? ? false : 'application'
  end

  def enjoy_gallery_gallery_action
    'enjoy_gallery_render_gallery'
  end

  def enjoy_gallery_gallery_partial
    nil
  end

  def enjoy_gallery_gallery_class
    Enjoy::Gallery::Gallery
  end

  def enjoy_gallery_gallery_images_method
    :images
  end

  def enjoy_gallery_load_gallery
    enjoy_gallery_gallery_class.find(params[:gallery_id])
  end

  def enjoy_gallery_gallery_load_images
    @gallery.send(enjoy_gallery_gallery_images_method).enabled.sorted.page(params[:page]).per(enjoy_gallery_render_gallery_images_per_page)
  end

  def enjoy_gallery_gallery_per_page
    4
  end


end
