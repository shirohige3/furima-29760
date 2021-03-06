class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date)
  end
end
