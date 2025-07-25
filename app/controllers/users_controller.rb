class UsersController < ApplicationController
  def new
    @user = User.new
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated." # Or redirect to new_user_path, whatever makes sense
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.expect(user: [ :email, :username, :password ])
  end
end
