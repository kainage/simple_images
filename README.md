# Simple Images

[![Build Status](https://travis-ci.org/kainage/simple_images.png)](https://travis-ci.org/kainage/simple_images)

Add one-click image uploading to active record models using **Dragonfly**

**Requires ruby >= 2.0.0**

**Requires rails >= 4.0.0**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_images'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install simple_images
```

Run the generator to create the migration, initializer and simple_image model files:

```
$ rails g simple_images
```

Migrate the database:

```
$ rake db:migrate
```

## Usage

### Image Model

This will be generated and placed in your app/models folder:

```ruby
class SimpleImage
  include SimpleImages::ImageAdditions
end
```

You can add custom functionality to the Message model here.

### Imageable Model

Add `has_simple_images` to the top of your activerecord model:

```ruby
class Article
  has_simple_images
end
```

Add the routes for the resource as well:

```ruby
  resources :articles
    resources :simple_images, shallow: true, only: [:create, :update, :destroy]
  end
```

The class is not restricted to Article, it can be any class you add ```has_simple_images``` to.

### Configuration

In the created initializer:

```
  config/initializers/simple_images.rb
```

You will find some configuration options availible.
Edit this file and restart you server to have the changes take effect.

### User and CanCan Integration

If you have a ```current_user``` it will assign the created image to that user.
Otherwise it will be nil.

If you are using cancan it will pick that up for the 3 controller methods and
check authorization respectively

```ruby
authorize! :create, @simple_image
authorize! :update, @simple_image
authorize! :destroy, @simple_image
```

### Helpers

The point of this gem is to have dead simple image uploading anywhere in your app.

An image must be associated to an active record model. If you want all images to be
availible to all things just pick an arbitrary object that you are not going to
destroy (such as first user) and associate all images with that record.

Include the stylesheets in your application.css manifest:

```
/*
 *= require simple_images/uploader
 *= require simple_images/spinner
*/
```

You can omit either stylesheet if you want to style your own upload button from scratch
or you do not want to use the spinner (or are not using AJAX)

Include the javascript file in your application.js manifest. If you want the basic,
page reloading functionality:

```
//= require simple_images/uploader
```

Or the AJAX uploader using jquery.fileupload:

```
//= require simple_images/ajax_uploader
```

If you are using the AJAX uploader, you MUST have a file in ```views/simple_images/create.js.erb```
and ```views/simple_images/update.js.erb``` with what to do after the form is submitted.
An example of create:

```
<% if @simple_image.new_record? %>
  alert("Failed to upload simple image: <%= j @simple_image.errors.full_messages.join(', ').html_safe %>");
<% else %>
  $("#simple_images").append("<%= j render(@simple_image) %>");
<% end %>
```

In your views you can call the following methods:

```
<%= render_simple_images_edit_link_for(image) %>
<%= render_simple_images_destroy_link_for(image) %>
<%= render_simple_images_actions_for(image) %>
<%= render_simple_images_form_for(imageable, spinner: false) %>
<%= render_simple_images_spinner(klass) %>
```

The spinner on the 'form_for' is meant for rendering the spinner with the form.
It will have a class of 'spinner' and a class of ```<%= dom_id(imageable) %>_spinner```
(ex 'article_4_spinner'). You can then show/hide the spinner with javascript.

The spinner helper, you pass it the class that you want the spinner to have.
For the spinner to automatically show, make sure your edit form id and the
spinner class are the same (ex 'edit_simple_image_134').

```si_dom_id``` is a helper to make a unique id (or class) to
push items to upon successful upload. It can be the simple_image, or the imageable:

```ruby
si_dom_id(@simple_image)
=> si_article_12

si_dom_id(@article)
=> si_article_12
```

### Creating Images

Click on the 'Add Image' Button and select a file to upload.
If your controller responds to ```current_user``` then it will be assigned to the image.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
