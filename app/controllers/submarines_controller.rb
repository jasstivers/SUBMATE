class SubmarinesController < ApplicationController
  def index
    @submarines = Submarine.all
  end
end
