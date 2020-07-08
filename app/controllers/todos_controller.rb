class TodosController < ApplicationController
    before_action :find_todo_by_id, only: [:update, :destroy]
    def index
        @todos = Todo.where(user_id: @user.id)
        render json: @todos
    end

    def create 
        @todo = Todo.create(
            title: params[:title],
            is_completed: params[:is_completed],
            editing: params[:editing],
            user_id: @user.id
        )
        render json: @todo
    end

    def update
        if @todo.update(
            title: params[:title],
            is_completed: params[:is_completed],
            editing: params[:editing]
        )
        render json: @todo
        else
            render status: 422
        end

    end

    def destroy
        if @todo.destroy
            render status: :no_content
        else 
            render status: :unprocessable_entity
        end
    end

    private

    def find_todo_by_id
        @todo = Todo.find(params[:id])
    end
end
