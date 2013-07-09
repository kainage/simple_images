module SimpleImages
  module SimpleImageAdditions
    def self.included(image_model)
      image_model.belongs_to :imageable, polymorphic: true

      image_model.image_accessor            :image
      image_model.validates_presence_of     :image
      image_model.validates_size_of         :image,
        maximum: SimpleImages.image_max_size
      image_model.send :validates_property, :format, {
        of: :image,
        in: SimpleImages.image_formats_allowed
      }
    end
  end
end