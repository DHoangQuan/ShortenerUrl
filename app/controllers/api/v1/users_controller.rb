# frozen_string_literal: true

module Api
  module V1
    # user controller
    class UsersController < ApplicationController
      before_action :authenticate_user!

      def index
        list_users = User.all.paginate(page: params[:page], per_page: 10)

        options = {}
        options[:meta] = {
          current_page: list_users.current_page,
          total_pages: list_users.total_pages,
          total_count: list_users.count
        }
        render json: UserSerializer.new(list_users, options).serialized_json
      end

      def create
        status = UserOperations::CreateUser.new(params).execute

        return render json: { status: 200, message: 'create succeed' } if status[:status] == 200

        render json: {
          status: :error,
          message: 'failed'
        }
      end

      def show
        user = User.find(params[:id])

        render json: UserSerializer.new(user).serialized_json
      rescue StandardError, AnotherError => e
        title = 'Not Found'
        render_error(404, title, e) and return
      end

      def update
        status = UserOperations::UpdateUser.new(params, current_user).execute

        return render json: { status: 200, message: 'update succeed' } if status[:status] == 200

        render json: {
          status: :error,
          message: 'failed'
        }
      end

      def change_password
        status = UserOperations::ChangePassword.new(params, current_user).execute

        return render json: { status: 200, message: 'Change password succeed' } if status[:status] == 200

        render json: {
          status: :error,
          message: 'failed'
        }
      end
    end
  end
end
