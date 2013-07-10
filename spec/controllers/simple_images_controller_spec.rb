require 'spec_helper'

describe SimpleImagesController do
  let(:article) { FactoryGirl.create(:article) }
  def attachment
    Rack::Test::UploadedFile.new("spec/assets/images/test.png", "image/png")
  end
  let(:valid_attributes) { { image: attachment } }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SimpleImage" do
        controller.request.should_receive(:referrer).and_return(article_url(article))
        expect {
          post :create, {article_id: article, simple_image: valid_attributes}
        }.to change(SimpleImage, :count).by(1)
      end

      it "assigns a newly created simple_image as @simple_image" do
        controller.request.should_receive(:referrer).and_return(article_url(article))
        post :create, {article_id: article, simple_image: valid_attributes}
        assigns(:simple_image).should be_a(SimpleImage)
        assigns(:simple_image).should be_persisted
      end

      it "redirects to the imageable" do
        controller.request.should_receive(:referrer).and_return(article_url(article))
        post :create, {article_id: article, simple_image: valid_attributes}
        response.should redirect_to(article)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved simple_image as @simple_image" do
        # Trigger the behavior that occurs when invalid params are submitted
        controller.request.should_receive(:referrer).and_return(article_url(article))
        SimpleImage.any_instance.stub(:save).and_return(false)
        post :create, {article_id: article, simple_image: { "image" => nil }}
        assigns(:simple_image).should be_a_new(SimpleImage)
      end

      it "redirects to imageable" do
        # Trigger the behavior that occurs when invalid params are submitted
        controller.request.should_receive(:referrer).and_return(article_url(article))
        SimpleImage.any_instance.stub(:save).and_return(false)
        post :create, {article_id: article, simple_image: { "image" => nil }}
        response.should redirect_to article
      end

      it "error message exists" do
        # Trigger the behavior that occurs when invalid params are submitted
        controller.request.should_receive(:referrer).and_return(article_url(article))
        SimpleImage.any_instance.stub(:save).and_return(false)
        post :create, {article_id: article, simple_image: { "image" => nil }}
        expect(flash[:alert]).to_not be_nil
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested simple_image" do
        simple_image = FactoryGirl.create(:simple_image, imageable: article)
        # Assuming there are no other simple_images in the database, this
        # specifies that the SimpleImage created on the previous line
        # receives the :update message with whatever params are submitted in the request.
        controller.request.should_receive(:referrer).and_return(article_url(article))
        SimpleImage.any_instance.should_receive(:update).with({ "image" => 'test2' })
        put :update, {id: simple_image.to_param, simple_image: { "image" => 'test2'}}
      end

      it "assigns the requested simple_image as @simple_image" do
        simple_image = FactoryGirl.create(:simple_image, imageable: article)
        controller.request.should_receive(:referrer).and_return(article_url(article))
        put :update, {id: simple_image.to_param, simple_image: valid_attributes}
        assigns(:simple_image).should eq(simple_image)
      end

      it "redirects to the imageable" do
        simple_image = FactoryGirl.create(:simple_image, imageable: article)
        controller.request.should_receive(:referrer).and_return(article_url(article))
        put :update, {id: simple_image.to_param, simple_image: valid_attributes}
        response.should redirect_to(simple_image.imageable)
      end
    end

    describe "with invalid params" do
      it "assigns the simple_image as @simple_image" do
        simple_image = FactoryGirl.create(:simple_image, imageable: article)
        # Trigger the behavior that occurs when invalid params are submitted
        controller.request.should_receive(:referrer).and_return(article_url(article))
        SimpleImage.any_instance.stub(:update).and_return(false)
        put :update, {id: simple_image.to_param, simple_image: { "image" => nil }}
        assigns(:simple_image).should eq(simple_image)
      end

      it "redirects to the imageable" do
        simple_image = FactoryGirl.create(:simple_image, imageable: article)
        # Trigger the behavior that occurs when invalid params are submitted
        controller.request.should_receive(:referrer).and_return(article_url(article))
        SimpleImage.any_instance.stub(:update).and_return(false)
        put :update, {id: simple_image.to_param, simple_image: { "image" => nil }}
        response.should redirect_to simple_image.imageable
      end

      it "error message exists" do
        simple_image = FactoryGirl.create(:simple_image, imageable: article)
        # Trigger the behavior that occurs when invalid params are submitted
        controller.request.should_receive(:referrer).and_return(article_url(article))
        SimpleImage.any_instance.stub(:update).and_return(false)
        post :update, {id: simple_image.to_param, simple_image: { "image" => nil }}
        expect(flash[:alert]).to_not be_nil
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested simple_image" do
      controller.request.should_receive(:referrer).and_return(article_url(article))
      simple_image = FactoryGirl.create(:simple_image, imageable: article)
      expect {
        delete :destroy, {id: simple_image.to_param}
      }.to change(SimpleImage, :count).by(-1)
    end

    it "redirects to the imageable" do
      controller.request.should_receive(:referrer).and_return(article_url(article))
      simple_image = FactoryGirl.create(:simple_image, imageable: article)
      delete :destroy, {id: simple_image.to_param}
      response.should redirect_to simple_image.imageable
    end
  end

end
