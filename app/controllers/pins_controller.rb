class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]

	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def show

	end

	def new
		@pin = current_user.pins.build
	end

	def edit

	end

	def create
		@pin = current_user.pins.build(pinParams)

		if @pin.save
			redirect_to @pin, notice: "successfully created new Pin!!"
		else
			render 'new'
		end
	end

	def update
		if @pin.update(pinParams)
			redirect_to @pin, notice: "Pin was successfully updated!!"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end

	private

	def pinParams
		params.require(:pin).permit(:title, :description, :image)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end
end
