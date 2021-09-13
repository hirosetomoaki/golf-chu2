class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :name, :name_initials, :state_id, :best_score, :email, :password, :password_confirmation)
  end
 
end
