class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :root
    else
      render "/devise/registrations/new.html.erb", status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: [ :email, :username, :password ])
  end
end
