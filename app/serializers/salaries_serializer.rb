class SalariesSerializer
  include JSONAPI::Serializer
  attributes :id, :type, :attributes
end