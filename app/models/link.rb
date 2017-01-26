require 'data_mapper'
require 'dm-postgres-adapter'
# require 'dm-migrations'


class Link
  include DataMapper::Resource

  property :id,    Serial
  property :title, String
  property :url,   String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/book_manager_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
