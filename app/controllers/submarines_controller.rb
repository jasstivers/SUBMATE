class SubmarinesController < ApplicationController
  def index
    @submarines = Submarine.all
  end

  def show
    @submarine = Submarine.find(params[:id])
  end
end
