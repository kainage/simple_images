FactoryGirl.define do
  factory :simple_image do
    image File.new("spec/assets/images/test.png")
  end
end