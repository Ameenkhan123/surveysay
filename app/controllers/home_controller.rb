class HomeController < ApplicationController
  def index
	end
		def show
	 @show = Show.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @home }
        end
	end
end

