class Admin::HomesController < Admin::ApplicationController
  def top
    @informations = Information.all
  end
end
