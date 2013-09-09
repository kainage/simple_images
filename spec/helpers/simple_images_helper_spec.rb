require 'spec_helper'

describe SimpleImagesHelper do
  before :each do
    @article = FactoryGirl.create(:article)
    @simple_image = FactoryGirl.create(:simple_image, imageable: @article)
  end

  describe "edit link helper" do
    it "should render" do
      expect(helper.render_simple_images_edit_link_for(@simple_image)).to match(
        'class="edit_simple_image"'
      )
    end
  end

  describe "destroy link helper" do
    it "should render" do
      expect(helper.render_simple_images_destroy_link_for(@simple_image)).to match(
        'class="destroy_simple_image"'
      )
    end
  end

  describe "actions link helper" do
    it "should render" do
      expect(helper.render_simple_images_actions_for(@simple_image)).to match(
        'class="edit_simple_image"'
      )
    end

    it "should render destroy link" do
      expect(helper.render_simple_images_actions_for(@simple_image)).to match(
        'class="destroy_simple_image"'
      )
    end
  end

  describe "form helper" do
    it "should render" do
      expect(helper.render_simple_images_form_for(@article)).to match(
        'class="new_simple_image"'
      )
    end
  end

  describe "si_dom_id" do
    it "should include imageable class lowercase and underscored" do
      expect(helper.si_dom_id(@article)).to match(/article/)
    end

    it "should include imageable id" do
      expect(helper.si_dom_id(@article)).to match(/#{@article.id}/)
    end

    it "should match expected outcome" do
      expect(helper.si_dom_id(@article)).to match(/si_article_#{@article.id}/)
    end
  end
end