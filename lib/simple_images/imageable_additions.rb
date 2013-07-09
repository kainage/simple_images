module SimpleImages
  module ImageableAdditions
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def has_simple_images
        include SimpleImages::ImageableAdditions::InstanceMethods

        has_many :simple_images, as: :imageable
      end
    end

    module InstanceMethods

    end
  end
end

ActiveRecord::Base.send(:include, SimpleImages::ImageableAdditions)