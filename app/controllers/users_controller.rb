class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create_credentials
    puts "logging in..."
    params.require(:email)
    params.require(:password)
    user = User.find_by(email: params[:email]) 
    if !user.nil? and user.valid_password?(params[:password])
      token = get_api_key(user)
      render json: {error: false, message: "Logged in successfully", user: user, api_key: token}, status: :ok
    else 
      user = User.new(email: params[:email], password: params[:password])
      if user.save
        token = get_api_key(user)
        render json: {error: false, message: "Registered successfully", user: user, api_key: token}, status: :created
      else 
        render json: {error: true, message: user.errors.full_messages}, status: :ok
      end
    end
  end
  
  private
    def get_api_key(user)
      require 'jwt'
      puts "Generating key..."
      hmac_secret = Rails.application.secrets.secret_key_base
      puts hmac_secret
      payload = { email: user.email, password: user.password }
      token = JWT.encode payload, hmac_secret, 'HS256'
      return token
      # puts token
      # for the API
      # decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

      # Array
      # [
      #   {"data"=>"test"}, # payload
      #   {"alg"=>"HS256"} # header
      # ]
      # puts decoded_token
      
      # if current_user.key.save
        # render json: {message: 'success', hash_key: hash}, status: :ok
      # else 
        # render json: {error: 'could not save key', message: current_user.key.errors.full_messages }, status: :unprocessable_entity
      # end
    end
end
