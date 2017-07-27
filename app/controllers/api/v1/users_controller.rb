class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]

	  def show
      @user = User.find(params[:id])
    end

   	def update
      @user = User.find(params[:id])
      @user.update_attributes(update_params)
    end

    private

    def update_params
      params.require(:user).permit(:name)
    end

end
