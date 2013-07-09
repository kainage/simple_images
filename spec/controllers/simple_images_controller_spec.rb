require 'spec_helper'

describe SimpleImagesController do
  let { @article = FactoryGirl.create(:article) }
  let {
    valid_attributes = FactoryGirl.create(:simple_image, imageable: @article).
    slice(:image_uid, :image_name, :imageable_id, :imageable_type)
   }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SimpleImage" do
        expect {
          post :create, {article_id: @article, simple_image: valid_attributes}
        }.to change(SimpleImage, :count).by(1)
      end

      it "assigns a newly created simple_image as @simple_image" do
        post :create, {article_id: @article, simple_image: valid_attributes}
        assigns(:simple_image).should be_a(SimpleImage)
        assigns(:simple_image).should be_persisted
      end

      it "redirects to the created simple_image" do
        post :create, {article_id: @article.id, simple_image: valid_attributes}
        response.should redirect_to(@article)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved simple_image as @simple_image" do
        # Trigger the behavior that occurs when invalid params are submitted
        SimpleImage.any_instance.stub(:save).and_return(false)
        post :create, {article_id: @article, simple_image: { "image_uid" => "test.ico" }}
        assigns(:simple_image).should be_a_new(SimpleImage)
      end

      it "redirects to imageable" do
        # Trigger the behavior that occurs when invalid params are submitted
        SimpleImage.any_instance.stub(:save).and_return(false)
        post :create, {article_id: @article, simple_image: { "image_uid" => "test.ico" }}
        response.should redirect_to @article
      end

      it "error message exists" do
        # Trigger the behavior that occurs when invalid params are submitted
        SimpleImage.any_instance.stub(:save).and_return(false)
        post :create, {article_id: @article, simple_image: { "image_uid" => "test.ico" }}
        expect(flash[:error]).to_not be_nil
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested simple_image" do
        simple_image = FactoryGirl.create(:simple_image, imageable: @article)
        # Assuming there are no other simple_images in the database, this
        # specifies that the SimpleImage created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SimpleImage.any_instance.should_receive(:update_attributes).with({ "image_uid" => "test2.png" })
        put :update, {id: simple_image.to_param, simple_image: { "image_uid" => "test2.png"}}
      end

      it "assigns the requested simple_image as @simple_image" do
        simple_image = FactoryGirl.create(:simple_image, imageable: @article)
        put :update, {id: simple_image.to_param, simple_image: valid_attributes}
        assigns(:simple_image).should eq(simple_image)
      end

      it "redirects to the imageable" do
        simple_image = FactoryGirl.create(:simple_image, imageable: @article)
        put :update, {id: simple_image.to_param, simple_image: valid_attributes}
        response.should redirect_to(simple_image.imageable)
      end
    end

    describe "with invalid params" do
      it "assigns the simple_image as @simple_image" do
        simple_image = FactoryGirl.create(:simple_image, imageable: @article)
        # Trigger the behavior that occurs when invalid params are submitted
        SimpleImage.any_instance.stub(:save).and_return(false)
        put :update, {article_id: @article, id: simple_image.to_param, simple_image: { "image_uid" => "test.ico" }}
        assigns(:simple_image).should eq(simple_image)
      end

      it "redirects to the imageable" do
        simple_image = FactoryGirl.create(:simple_image, imageable: @article)
        # Trigger the behavior that occurs when invalid params are submitted
        SimpleImage.any_instance.stub(:save).and_return(false)
        put :update, {article_id: @article, id: simple_image.to_param, simple_image: { "image_uid" => "test.ico" }}
        response.should redirect_to simple_image.imageable
      end

      it "error message exists" do
        # Trigger the behavior that occurs when invalid params are submitted
        SimpleImage.any_instance.stub(:save).and_return(false)
        post :create, {article_id: @article, simple_image: { "image_uid" => "test.ico" }}
        puts flash.inspect
        expect(flash[:error]).to_not be_nil
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested simple_image" do
      simple_image = FactoryGirl.create(:simple_image, imageable: @article)
      expect {
        delete :destroy, {article_id: @article, id: simple_image.to_param}
      }.to change(SimpleImage, :count).by(-1)
    end

    it "redirects to the imageable" do
      simple_image = FactoryGirl.create(:simple_image, imageable: @article)
      delete :destroy, {article_id: @article, id: simple_image.to_param}
      response.should redirect_to simple_image.imageable
    end
  end

end
