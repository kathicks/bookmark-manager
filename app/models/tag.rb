require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative 'link'


class Tag
  include DataMapper::Resource

  property :id,    Serial
  property :name,  String
  # has n, :links, :through => Resource
end
