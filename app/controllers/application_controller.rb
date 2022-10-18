class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ログイン後に遷移するページをtopからaboutへ変更(デフォルトはroot_path)
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  # ログアウト後に遷移するページをtopからaboutへ変更(デフォルトはroot_path)
  def after_sign_out_path_for(resource)
    about_path
  end
  
  
  # 以下ストロングパラメータと同じような働き。deviseへの変更を許可する。
  # privateではなくprotectedなのは、privateは同じコントローラー内からでしか参照できないが、
  # protectedは別コントローラーでも参照できるから。
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end