class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    render json: sighting.to_json(include: {
                                    bird: { only: %i[name species] },
                                    location: { only: %i[latitude longitude] }
                                  }, except: [:updated_at])
  end
end
