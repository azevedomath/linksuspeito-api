class Api::V1::UrlsController < ApplicationController
  before_action :check_api_key
  before_action :set_url, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /urls
  # GET /urls.json
  def index
    user = User.find(@key.user_id)
    @urls = user.urls.order(:id)
    render json: {total: @urls.count, urls: @urls}, status: :ok
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    render json: @url
  end

  # POST /urls
  def create
    params.require(:destination)
    key = get_random_key
    base_url = Rails.env == 'production' ? 'http://www.domain.com/' : 'http://localhost:3000/go/'
    full_url = base_url + key
    @url = Url.new(user_id: @key.user_id, destination: params[:destination], key: key, full_url: full_url)

    if @url.save
      render json: {url: @url}, status: :ok
    else
      render json: {errors: @url.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /urls/1
  def update
    params.require(:destination)
    if @url.update(destination: params[:destination])
      render json: {url: @url}, status: :ok
    else
      render json: {errors: @url.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    head :no_content 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by(id: params[:id], user_id: @key.user_id)
    end

    # Get a secure and unique random url
    def get_random_key
      # base_url = Rails.env == 'production' ? 'domain.com' : 'http://localhost:3000/go/'
      while true do
          key = SecureRandom.urlsafe_base64(4)
          return key if !Url.where(key: key).exists?
      end 
    end

    # Check if the API Key is valid
    def check_api_key
      require 'jwt'
      params.require(:api_key)
      token = params[:api_key]
      hmac_secret = Rails.application.secrets.secret_key_base
      decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
      
      user = User.find_by(email: decoded_token)
      if @key.nil?
        return render json: {error: "You API key is invalid. Please provide one valid key"}, status: :bad_request
      end
    end

end
