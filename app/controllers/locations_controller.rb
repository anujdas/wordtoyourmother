class LocationsController < ApplicationController
  def create
    if !params[:device_id].blank?
      d = Device.find_by_identifier(params[:device_id])
      if d
        l = Location.new
        l.lat = params[:lat]
        l.lng = params[:lng]
        l.accuracy = params[:accuracy]
        l.time = Time.now
        l.device = d
        l.save!
      end
    end
    respond_to do |format|
      format.html { render :nothing => true }
      format.json { render :json => @devices }
    end
  end
end
