class Admin::InformationsController < ApplicationController
  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    @information.save
    redirect_to admin_root_path
  end

  def show
    @information = Information.find(params[:id])
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    @information.update(information_params)
    redirect_to admin_information_path(@information)
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    redirect_to admin_root_path
  end

  private

  def information_params
    params.require(:information).permit(:title, :body)
  end
end
