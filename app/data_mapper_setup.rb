require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

require './app/models/tag'
require './app/models/link'
require './app/models/user'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
