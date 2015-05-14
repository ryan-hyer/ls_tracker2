class UsersController < ApplicationController
  before_action :set_user, only: :destroy

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: false
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.save
        flash[:notice] = "User was succesfully created."
        format.html { redirect_to users_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @user} }
      end
    end
  end

  # DELETE /users/1
  def destroy
    if @user == current_user
      redirect_to users_path, alert: 'Do not delete your own account!'
    else
      @user.destroy
      redirect_to users_path, notice: 'User was successfully deleted.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
