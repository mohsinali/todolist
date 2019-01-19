class Api::V1::TodosController < Api::V1::ApiController
  before_action :authenticate_via_token

  before_action :check_required_params, only: [:create]
  before_action :set_todo, only: [:show, :update, :destroy]
  
  def index
    @todos = @user.todos
  end

  def create
    @todo = @user.todos.new(todo_params)
    @todo.save!

    return render json: { success: true, msg: 'Todo was created successfully.' }, status: 201
  end

  def update
    @todo.update(todo_params)
  end

  def destroy
    @todo.destroy

    return render json: { success: true, msg: 'Todo item was deleted successfully.' }, status: 201
  end

  private
    def todo_params
      params.fetch(:todo, {}).permit(:title, :is_complete)
    end

    def set_todo
      if params[:id].blank?
        return render json: { success: false, msg: 'Todo id is required.' }, status: 422
      end

      @todo =  Todo.find_by(id: params[:id])
      if !@todo || @todo.user_id != @user.id
        return render json: { success: false, msg: 'Invalid todo item.' }, status: 422
      end
    end

    def check_required_params
      if params[:title].blank?
        return render json: { success: false, msg: 'Title is required.' }, status: 422
      end
    end


end
