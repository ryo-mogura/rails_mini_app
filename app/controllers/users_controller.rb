class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録完了！'
    else
      flash.now[:danger] = '登録失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
