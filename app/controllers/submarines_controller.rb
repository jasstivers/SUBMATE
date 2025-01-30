class SubmarinesController < ApplicationController
  def index
    @submarines = Submarine.all
    @categories = Submarine.distinct.pluck(:submarine_class)

    if params[:price_range].present?
      @submarines = @submarines.where('price <= ?', params[:price_range])
    end

    if params[:categories].present? && params[:categories].any?
      @submarines = @submarines.where(submarine_class: params[:categories])
    end

    if params[:autonomies].present?
      selected_amenities = params[:autonomies]
      selected_amenities.each do |amenity|
        @submarines = @submarines.where('amenities ILIKE ?', "%#{amenity}%")
      end
    end

    if params[:production_years].present?
      @submarines = @submarines.where(prod_year: params[:production_years])
    end

    if params[:search].present?
      @submarines = @submarines.where('name ILIKE ?', "%#{params[:search]}%")
    end

    if params[:sort_by].present?
      case params[:sort_by]
      when 'price'
        @submarines = @submarines.order(price: :asc)
      when 'price_asc'
        @submarines = @submarines.order(price: :asc)
      when 'price_desc'
        @submarines = @submarines.order(price: :desc)
      end
    end
  end

  def show
    @submarine = Submarine.find(params[:id])
    end

    def new
      @submarine = Submarine.new
    end

    def create
      @submarine = current_user.submarines.new(submarine_params)
      if @submarine.save
        redirect_to submarines_path
      else
        render :new
      end
    end

    def destroy
      @submarine = Submarine.find(params[:id])
      @submarine.destroy
      redirect_to submarines_path, notice: 'Submarine destroyed'
    end

    private

    def submarine_params
      params.require(:submarine).permit(:name, :price, :submarine_class, :amenities, :description, :weight_ton, :prod_year, :speed, :image_tag)
    end
end
