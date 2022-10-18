class PostImage < ApplicationRecord
  has_one_attached :image
  
  # 1対Nの関係。PostImgageは「」
  belongs_to :user
end
