require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'


class Link
  include DataMapper::Resource

    property :id, Serial
    property :link_address, String
    property :link_name, String

end


DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
