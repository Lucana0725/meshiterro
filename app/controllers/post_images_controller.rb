class PostImagesController < ApplicationController
  def new
    # formに渡すための「空のモデル」を作成。@post_imageに代入。@のお陰でpost_imageをviewで使うことができる。
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end
  
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
