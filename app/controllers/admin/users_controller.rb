class Admin::UsersController < ApplicationController
  authorize_resource class: :admin_user
  before_action :set_user, only: %i[ edit update destroy ]

  def index
    @users = User.includes(:company)
  end

  def new
    @user = User.new
    @companies = Company.all
  end

  def create
    # company = Company.find_by(id: user_params[:company_id])
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t(".notice")
      redirect_to admin_users_path
    else
      @companies = Company.all
      render :new
    end
  end
  
  def edit
    @companies = Company.all
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t(".notice")
      redirect_to admin_users_path
    else
      @companies = Company.all
      render :edit
    end

  end

  def destroy
    if @user.destroy
      flash[:notice] = t(".notice")
      redirect_to admin_users_path
    else
      @companies = Company.all
      render :index
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :company_id, :email, :password, :password_confirmation, :admin)
  end

end
