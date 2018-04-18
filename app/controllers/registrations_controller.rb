class RegistrationsController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path, notice: "Thanks for signing up!"
		else
			redirect_to registrations_path, notice: @user.errors.full_messages.to_sentence
		end
	end

private
	def user_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end

end
