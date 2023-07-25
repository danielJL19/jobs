class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    #kind es "tipo", es decir, uno define las cadenas de caracteres o enum que pueden
    #realizar tal acción. 
    #sino, incluye ninguno de esos roles o cadena de caracteres entregados, dentro de 
    #ese parametro, los llevara a tirar un error 
    def authorize_request(kind = nil)
        unless kind.include?(current_user.roles)
        redirect_to root_path, notice: "No estás autorizado para acceder a estas funciones"
        end
       end
       


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:position, :roles])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name,:position, :roles])
    end
end
