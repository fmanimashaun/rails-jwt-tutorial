class CarSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description
end
