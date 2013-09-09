class SimpleImagesController < ApplicationController
  before_filter :find_imageable, except: :index

  def create
    @simple_image = @imageable.simple_images.build(simple_image_params)
    @simple_image.user_id = current_user.id if respond_to?(:current_user)

    authorize! :create, @simple_image if defined?(CanCan::Ability)

    respond_to do |format|
      if @simple_image.save
        format.html { redirect_to request.referrer, notice: 'Image was successfully created.' }
        format.js
      else
        format.html { redirect_to request.referrer, alert: @simple_image.errors.full_messages.join(', ') }
        format.js
      end
    end
  end

  def update
    @simple_image = SimpleImage.find(params[:id])
    authorize! :update, @simple_image if defined?(CanCan::Ability)

    respond_to do |format|
      if @simple_image.update(simple_image_params)
        format.html { redirect_to request.referrer, notice: 'Image was successfully updated.' }
        format.js
      else
        format.html { redirect_to request.referrer, alert: @simple_image.errors.full_messages.join(', ') }
        format.js
      end
    end
  end

  def destroy
    @simple_image = SimpleImage.find(params[:id])
    authorize! :destroy, @simple_image if defined?(CanCan::Ability)

    @imageable = @simple_image.imageable
    @simple_image.destroy

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Image was permanently removed.' }
    end
  end

  private

  def simple_image_params
    params.require(:simple_image).permit(:image)
  end

  def find_imageable
    resource, id = request.path.split('/')[1, 2]
    @imageable = resource.singularize.classify.constantize.find(id)
  end
end
