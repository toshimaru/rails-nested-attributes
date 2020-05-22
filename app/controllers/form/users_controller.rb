class Form::UsersController < ApplicationController
  before_action :set_form_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user_form = UserForm.new(todo_tasks: Array.new(5))
  end

  def edit
  end

  def create
    @user_form = UserForm.new(form_user_params)

    respond_to do |format|
      if @user_form.valid? && @user_form.save
        format.html { redirect_to form_user_path(@user_form.user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @form_user.update(form_user_params)
        format.html { redirect_to @form_user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @form_user.destroy
    respond_to do |format|
      format.html { redirect_to form_users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def form_user_params
      params.require(:user_form).permit(:name, :email, todo_tasks: [])
    end
end
