class Article < ActiveRecord::Base
  has_simple_images
end

class SimpleImage < ActiveRecord::Base
  include SimpleImages::SimpleImageAdditions
end