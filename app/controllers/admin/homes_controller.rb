class Admin::HomesController < ApplicationController
  def top
    @informations = Information.all
  end
end
