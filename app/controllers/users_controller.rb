class UsersController < ApplicationController
  before_action :set_user
  before_action :authorize_user!, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    if user_params[:password].blank?
      # Pas de changement de mot de passe : on exclut les champs password
      if @user.update(user_params.except(:password, :password_confirmation))
        redirect_to @user, notice: 'Mise à jour complétée avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      # Changement de mot de passe inclus
      if @user.update(user_params)
        redirect_to @user, notice: 'Mise à jour complétée avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    unless @user == current_user
      redirect_to root_path, alert: 'Action non autorisée.'
    end
  end

  def user_params
    params.require(:user).permit(:photo, :name, :password, :password_confirmation)
  end
end
