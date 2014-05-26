class VehicleModelsController < ApplicationController
  def index
    brand = VehicleBrand.find_by_name(params[:brand_name])
    if brand.nil?
      render nothing: true
    else
      render json: brand.models
    end
  end
end
