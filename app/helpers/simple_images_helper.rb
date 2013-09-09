module SimpleImagesHelper
  def render_simple_images_edit_link_for(image)
    render 'simple_images/edit', image: image
  end

  def render_simple_images_destroy_link_for(image)
    render 'simple_images/destroy', image: image
  end

  def render_simple_images_actions_for(image)
    [].tap do |ary|
      ary << render_simple_images_edit_link_for(image)
      ary << render_simple_images_destroy_link_for(image)
    end.join.html_safe
  end

  def render_simple_images_form_for(imageable)
    render 'simple_images/form', imageable: imageable
  end

  def si_dom_id(imageable)
    'si_' + imageable.class.to_s.underscore + '_' + imageable.id.to_s
  end
end