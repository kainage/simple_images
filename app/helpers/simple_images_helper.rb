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

  def render_simple_images_form_for(imageable, spinner: false)
    render 'simple_images/form', imageable: imageable, spinner: spinner
  end

  def render_simple_images_spinner(klass)
    render 'simple_images/spinner', klass: klass
  end

  def si_dom_id(image_or_imageable)
    if image_or_imageable.is_a?(SimpleImage)
      'si_' + image_or_imageable.imageable.class.to_s.underscore + '_' +
      image_or_imageable.imageable.id.to_s
    else
      'si_' + image_or_imageable.class.to_s.underscore + '_' +
      image_or_imageable.id.to_s
    end
  end
end