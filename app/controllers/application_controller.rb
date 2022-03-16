class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password,:mobile,:gender,:image,images: [])}
               devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :email, :password, :current_password,:mobile,:gender,:image, images: [] )}
          end

end

# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
#     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
#     devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
#     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
#   end
# end