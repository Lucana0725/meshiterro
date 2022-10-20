class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # 1対Nの関係。userは「1」
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  # プロフィール画像をアップロードできるようにする
  # profile_imageという名前で、ActiveStrageでプロフィール画像を保存できるように。
  has_one_attached :profile_image
  
  # プロフィール画像を100x100のサイズにリサイズして取得するメソッド
  # 追記：メソッドに(width, height)の引数を持たせることで100x100だけでないサイズを実行時に指定できるよう改良
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end