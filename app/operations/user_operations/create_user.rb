# frozen_string_literal: true

module UserOperations
  # asd
  class CreateUser
    def initialize(params)
      @params = params
    end

    def execute
      return { status: 'confirmation password must be the same password' } unless valid_password

      user = User.new(
        name: @params[:name],
        email: @params[:email],
        password: @params[:password]
      )

      return { status: 'failed' } unless user.valid?

      user.save!

      { status: 200 }
    end

    def valid_password
      @params[:password] == @params[:password_confirmation]
    end
  end
end
