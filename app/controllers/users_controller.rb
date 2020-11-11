class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :address,
                                 :phone_number,
                                 :email,
                                 :bio)
  end
end
