class SubmarinesController < ApplicationController
  def index
    @submarines = Submarine.all

    if params[:price_ranges].present?
      price_ranges = params[:price_ranges]
      if price_ranges.include?('under_1m')
        @submarines = @submarines.where('price < ?', 1_000_000)
      end
      if price_ranges.include?('1m_to_10m')
        @submarines = @submarines.where(price: 1_000_000..10_000_000)
      end
      if price_ranges.include?('above_10m')
        @submarines = @submarines.where('price > ?', 10_000_000)
      end
    end

    if params[:categories].present?
      @submarines = @submarines.where(submarine_class: params[:categories])
    end

    if params[:autonomies].present?
      @submarines = @submarines.where(amenities: params[:autonomies])
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

    if params[:depth].present?
      @submarines = @submarines.where('amenities ILIKE ?', "%#{params[:depth]}%")
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

    private

    def submarine_params
      params.require(:submarine).permit(:name, :price, :submarine_class, :amenities, :description, :weight_ton, :prod_year, :speed, :image_tag)
    end
end
