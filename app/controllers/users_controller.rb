class UsersController < ApplicationController

  before_action :set_current_user

  def home
  end

  def login
  end

  def check
  	@current_user = User.where(name: params[:name], password: params[:password]).first
  	if @current_user
  		session[:user_id] = @current_user.id
  		flash[:info] = "Vous êtes maintenant connecté"
  		redirect_to "/users/home"
  	else
  		session[:user_id] = nil
  		flash[:info] = "Echec de la connexion"
  		redirect_to "/users/login"
  	end
  end
end
