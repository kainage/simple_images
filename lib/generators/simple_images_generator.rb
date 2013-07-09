require 'rails/generators/migration'

class SimpleImagesGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path("../templates", __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_simple_images_files
    copy_file "simple_image.rb", "app/models/simple_images.rb"
    copy_file "initializer.rb", "config/initializers/simple_images.rb"
    migration_template "create_simple_images.rb", "db/migrate/create_simple_images.rb"
  end
end