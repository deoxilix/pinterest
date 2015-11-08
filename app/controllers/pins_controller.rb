class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]

	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@pin = Pin.new
	end

	def edit

	end

	def create
		@pin = Pin.new(pinParams)

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

	private

	def pinParams
		params.require(:pin).permit(:title, :description)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end
end
