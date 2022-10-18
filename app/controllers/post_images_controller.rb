class PostImagesController < ApplicationController
  def new
    # formに渡すための「空のモデル」を作成。@post_imageに代入。@のお陰でpost_imageをviewで使うことができる。
    @post_image = PostImage.new
  end

  def index
  end

  def show
  end
end
