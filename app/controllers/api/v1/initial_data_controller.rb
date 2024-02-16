class API::V1::InitialDataController < ApplicationController
  def index
    @cities = City.all
    @engine_types = EngineType.all

    render json: {
      status: { code: 200, message: 'Initial data fetched.' },
      data: {
        cities: @cities.map { |city| CitySerializer.new(city).serializable_hash[:data][:attributes] },
        engine_types: @engine_types.map do |engine_type|
                        EngineTypeSerializer.new(engine_type).serializable_hash[:data][:attributes]
                      end
      }
    }, status: :ok
  end
end
