# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.search(params[:q]).result
    render_object users
  end

  def show
    user = User.find(params[:id])
    render_object user
  end

  def create
    user = User.new(user_params)
    user.save
    render_object user
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    render_object user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render_object user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
