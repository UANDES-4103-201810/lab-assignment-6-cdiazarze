class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user.nil?
			redirect_to root_path, notice: "Usuario no existe"
		else
			if @user.password.==(params[:session][:password])
				session[:user_id] = @user.id
				redirect_to @user, notice: "Welcome!"
			else
				redirect_to root_path, notice: "Usuario no existe"
			end
		end
	end

	def destroy
		session[:user_id]=nil
		redirect_to root_url, notice: "You're now signed out!"
	end
end
