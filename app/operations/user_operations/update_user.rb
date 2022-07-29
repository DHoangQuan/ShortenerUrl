# frozen_string_literal: true

module UserOperations
  # create operation
  class UpdateUser
    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def execute
      user_update = @current_user.update(
        name: @params[:name]
      )

      return { status: 'failed' } unless user_update

      { status: 200 }
    end
  end
end
