class Api::V1::TodosController < Api::V1::ApiController
  before_action :check_required_params
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
  end

  def create
    
  end

  private
    def todo_params
      params.fetch(:todo, {}).permit(:title, :is_complete)
    end

    def set_todo
    end

    def check_required_params
      if params[:title].blank?
        return render json: { success: false, msg: 'Title is required.' }, status: 422
      end
    end


end
