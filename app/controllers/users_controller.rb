class UsersController < ApplicationController

    def signup 
        user = User.new(
            email: params[:email],
            password: params[:password]
        )
        if user.save
            payload = {'user_id': user.id}
            token = encode(payload)
            response.headers['Authorization'] = "Bearer #{token}"
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :bad_request
        end
        
    end

    def login
        user = User.find_by(email: params[:email])
    
        if user&.valid_password?(params[:password])

            payload = {'user_id': user.id}
            token = encode(payload)
            response.headers['Authorization'] = "Bearer #{token}"

            render json: user, status: :ok
        else 
            render json: {Errors: "Invalid Credentials."}, status: :unauthorized,
            authenticated: false
        end
    end


end