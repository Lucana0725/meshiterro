class PostImage < ApplicationRecord
  has_one_attached :image
  
  # 1対Nの関係。PostImgageは「1」
  belongs_to :user
  # 1対Nの関係。post_commentsに対してpost_imagesは「1」
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # バリデーションの設定
  validates :image, presence: true
  validates :shop_name, presence: true
  
  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
