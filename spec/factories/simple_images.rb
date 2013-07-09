FactoryGirl.define do
  factory :simple_image do
    title "Title"
    description "Description"
    image File.new("spec/assets/images/test.png")
  end
end