class SubmarinesController < ApplicationController
  def index
    @submarines = Submarine.all

    # Filter by Price Range
    if params[:price_slider_min].present? && params[:price_slider_max].present?
      min_price = params[:price_slider_min].to_i
      max_price = params[:price_slider_max].to_i

      @submarines = @submarines.where('price >= ? AND price <= ?', min_price, max_price)
    end

    if params[:categories].present?
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

    if params[:depth].present?
      @submarines = @submarines.where('depth = ?', params[:depth])
    end
  end

  def show
    @submarine = Submarine.find(params[:id])
  end
end
