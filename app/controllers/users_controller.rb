class UsersController < ApplicationController
  def home
  	if session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
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

  def destroy
		@current_user = User.find(session[:user_id])
		if @current_user
		    @current_user.destroy
		    flash[:info] = "Vous avez bien été déconnecté"
		end
		  redirect_to "/users/home"
	end
end
