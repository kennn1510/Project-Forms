class UsersController < ApplicationController
  def new
  end

  def create
    # @user = User.new(params[:user])
    @user = ::User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.expect(user: [ :email, :username, :password ])
  end
end
