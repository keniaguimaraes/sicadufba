class UserController < ApplicationController
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
     params.require(:user).permit(:email,:username,:curso_id)
    end
     
end
