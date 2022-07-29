# frozen_string_literal: true

module UserOperations
  # change password
  class ChangePassword
    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def execute
      return { status: 'failed' } unless valid_password

      user_update = @current_user.update(
        password: @params[:password]
      )

      return { status: 'failed' } unless user_update

      { status: 200 }
    end

    private

    def valid_password
      @params[:password] == @params[:password_confirmation]
    end
  end
end
