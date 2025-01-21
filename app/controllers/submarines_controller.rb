class SubmarinesController < ApplicationController
  def show
    @Submarine = Submarine.find(params[:id])
  end
end
