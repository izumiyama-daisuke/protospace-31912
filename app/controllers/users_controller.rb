class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #prototype = Prototype.find(params[:id])
    #@user = prototype.user_id
   #@prototype = Prototype.find(user_id == params[:id])
    @prototype = Prototype.where(user_id:  params[:id])
  end
end
