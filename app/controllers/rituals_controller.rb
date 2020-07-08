class RitualsController < ApplicationController
    before_action :find_ritual_by_id, only: [:update, :destroy]
    def index
        @rituals = Ritual.where(user_id: @user.id)
        render json: @rituals
    end

    def create 
        @ritual = Ritual.create(
            ritualTitle: params[:ritualTitle],
            # current_date: params[:current_date],
            is_done_for_the_day: params[:is_done_for_the_day],
            editing: params[:editing],
            user_id: @user.id
        )

        render json: @ritual, status: :created
    end

    def update
        if @ritual.update(
            current_date: params[:current_date],
            is_done_for_the_day: params[:is_done_for_the_day],
            editing: params[:editing])
        render json: @todo
        else
            render status: 422
        end

    end

    def destroy
        if @ritual.destroy
            render status: :no_content
        else
            render status: :unprocessable_entity
        end
    end

    private

    def find_ritual_by_id
        @ritual = Ritual.find(params[:id])
    end

end
