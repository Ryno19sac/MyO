class JournalsController < ApplicationController

    def index
        @journals = Journal.where(user_id: @user.id) 
        render json: @journals
    end

    def show
        @journal = Journal.find_by(params[:id])
        render json: @journal
    end


    def create
        @journal = Journal.create(
            entry: params[:entry],
            user_id: @user.id,
            entryDate: params[:entryDate],
        )
        render json: @journal
    end

    def destroy
        @journal = Journal.find_by(params[:id])
        
        if @journal.destroy
            render status: :no_content
        else
            render status: :unprocessable_entity
        end
    end

    
end
