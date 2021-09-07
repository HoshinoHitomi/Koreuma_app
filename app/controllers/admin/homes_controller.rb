class Admin::HomesController < Admin::ApplicationController
  def top
    @informations = Information.page(params[:page]).per(10)
  end
end
