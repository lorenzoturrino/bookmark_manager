require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

    property :id, Serial
    property :link_address, String
    property :link_name, String

    has n, :tags, :through => Resource

end
