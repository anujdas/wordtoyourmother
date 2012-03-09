class LocationsController < ApplicationController
  def index
  end

  def create
    if !params[:device_id].blank?
      d = Device.find_by_identifier(params[:device_id])
      if d
        @location = Location.new
        @location.lat = params[:lat]
        @location.lng = params[:lng]
        @location.accuracy = params[:accuracy]
        @location.rssi = params[:rssi]
        @location.time = Time.now
        @location.device = d
        @location.save!
      end
    end
    respond_to do |format|
      format.html { render :nothing => true }
      format.json { render :json => @location }
    end
  end
end
