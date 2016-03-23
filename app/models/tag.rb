require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'


class Tag
  include DataMapper::Resource

    property :id, Serial
    property :tag_name, String

    has n, :links, :through => Resource

end
