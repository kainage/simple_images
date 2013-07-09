module SimpleImages
  # Set the maximum size allowed of uploaded images.
  mattr_accessor :image_max_size
  @@image_max_size = 5.megabytes

  # Set list of availible formats allowed for image uploads.
  mattr_accessor :image_formats_allowed
  @@image_formats_allowed = [:jpg, :jpeg, :png, :gif]

  def self.setup
    yield self
  end
end