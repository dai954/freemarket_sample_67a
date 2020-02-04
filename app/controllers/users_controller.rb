class UsersController < ApplicationController
  def index

  end

  def new
    render :layout => "mailer.text"
  end

  def show

  end
  
  def login

  end

  def logout

  end

  def card

  end
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
    params.require(:user).permit(:name, :email)
  end
end
