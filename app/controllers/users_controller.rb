class UsersController < ApplicationController
    before_action :find_user_by_id, only: [:destroy]
    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    
    def index
        @user = User.all
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

   
    def destroy
        if @user.destroy
         redirect_to action: '/'
        else 
            render status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
    def find_user_by_id
        @user = User.find(params[:id])
    end

end
