class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # 1対Nの関係。userは「1」
  has_many :post_images, dependent: :destroy
  
  # プロフィール画像をアップロードできるようにする
  # profile_imageという名前で、ActiveStrageでプロフィール画像を保存できるように。
  has_one_attached :profile_image
  
  プロフィール画像を100x100のサイズにリサイズして取得するメソッド
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).proccessed
  end
end