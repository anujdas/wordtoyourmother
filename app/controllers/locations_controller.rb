class LocationsController < ApplicationController
  def index
    @device = Device.find_by_identifier(params[:device_id])
    @locations = @device.locations
    respond_to do |format|
      format.html
      format.json { render :json => @locations }
    end
  end

  def create
    if !params[:device_id].blank?
      @device = Device.find_by_identifier(params[:device_id])
      if @device.nil?
        @device = Device.new
        @device.identifier = params[:identifier]
        @device.locate_enabled = false
        @device.save!
      end
      @location = Location.new
      @location.lat = params[:lat]
      @location.lng = params[:lng]
      @location.accuracy = params[:accuracy]
      @location.rssi = params[:rssi]
      @location.time = Time.now
      @location.device = @device
      @location.save!
    end
    respond_to do |format|
      format.html { render :nothing => true }
      format.json { render :json => @location }
    end
  end
end
