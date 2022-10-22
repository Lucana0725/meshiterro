class PostImagesController < ApplicationController
  def new
    # formに渡すための「空のモデル」を作成。@post_imageに代入。@のお陰でpost_imageをviewで使うことができる。
    @post_image = PostImage.new
  end

  # def create
  #   @post_image = PostImage.new(post_image_params)
  #   @post_image.user_id = current_user.id
  #   @post_image.save
  #   redirect_to post_images_path
  # end
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    # @post_images = PostImage.all
    # kaminariのpageメソッドを1ページ文の決められた数のデータだけを新しい順に取得する
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
