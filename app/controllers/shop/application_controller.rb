class Shop::ApplicationController < ApplicationController
  before_action :authenticate_shop!
end