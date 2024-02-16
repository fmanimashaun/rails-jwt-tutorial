class API::V1::InitialDataController < ApplicationController
  def index
    cities = City.all
    engine_types = EngineType.all

    render json: {
      cities: CitySerializer.new(cities).serialized_json,
      engine_types: EngineTypeSerializer.new(engine_types).serialized_json
    }
  end
end
