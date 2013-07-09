require 'spec_helper'

describe SimpleImages do
  let(:article) { FactoryGirl.create(:article) }
  subject { FactoryGirl.create(:simple_image, imageable: article) }

  it { should be_valid }
  it { should validate_presence_of :image }

  # TODO test for setting max size
  # TODO test for setting format validation
end