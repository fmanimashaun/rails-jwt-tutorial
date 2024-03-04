class Users::CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {
      status: {
        code: 200,
        message: 'User details fetched successfully',
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    }, status: :ok
  end
end
