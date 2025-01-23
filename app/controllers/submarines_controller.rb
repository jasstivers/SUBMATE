class SubmarinesController < ApplicationController
  def index
    @submarines = Submarine.all
  end

  def show
    @Submarine = Submarine.find(params[:id])
  end
end
