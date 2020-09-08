class ServerController < ApplicationController
  before_action :authenticate_user!, except: [:move]
  def move 
    p 'moving.....'
    @url = Url.find_by(key: params[:url])
    if @url.nil? 
      redirect_to '/404'
    else   
      if @url.active 
        @url.clicked += 1
        @url.save
        redirect_to @url.destination
      else
        render json: {error: 'This URL is not active :/'}, status: :unprocessable_entity
      end
    end
  end
end
