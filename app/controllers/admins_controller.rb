class AdminsController < ApplicationController
  before_action :authenticate_admin!, except: :history

  def user
    @users = User.all
  end

  def history
    @histories = History.where(user_id:current_user)
  end

  def make_user
    @user = User.find(params[:user])
    @user.admin = params[:valor]
    if @user.save
      redirect_to admins_user_path, notice: "Privilegios de admin para #{@user.name} eliminados"
    else
      redirect_to admins_user_path, notice: 'Error al modificar'
    end
  end

  def make_admin
    @user = User.find(params[:user])
    @user.admin = params[:valor]
    if @user.save
      redirect_to admins_user_path, notice: "Privilegios de admin para #{@user.name} agregados"
    else
      redirect_to admins_user_path, notice: 'Error al modificar'
    end
  end

  private

  def authenticate_admin!
    redirect_to user_session_path unless current_user.admin?
  end
end
