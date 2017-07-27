class MeetupsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@meetups = Meetup.all
	end

	def show
		@meetup = Meetup.find(params[:id])
	end

	def new
		@meetup = Meetup.new
	end

	def create
		@meetup = Meetup.new(meetup_params)
		@meetup.save

		redirect_to meetups_path
	end

	def edit
		@meetup = Meetup.find(params[:id])
	end

	def update
		@meetup = Meetup.find(params[:id])
		@meetup.update(meetup_params)

		redirect_to meetups_path, notice: "Update Success"
	end

	def destroy
		@meetup = Meetup.find(params[:id])
		@meetup.destroy
		flash[:alert] = "meetup delete"
		redirect_to meetups_path
	end

	private

	def meetup_params
		params.require(:meetup).permit(:title, :description)
	end
end
