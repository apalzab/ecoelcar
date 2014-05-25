class VehicleModelsController < ApplicationController
  def index
    brand = VehicleBrand.find_by_name(params[:brand_name])
    if brand
      respond_to do |format|
        format.json { render :json => brand.models.all }
      end
    end
  end
end
