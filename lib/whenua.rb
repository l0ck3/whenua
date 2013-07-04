require 'whenua/version'
require_relative 'whenua/exceptions'
require_relative 'whenua/couchbase/data_store' # TODO : Conditional loading of datastores
require_relative 'whenua/memory/data_store' # TODO : Conditional loading of datastores
require_relative 'whenua/entity'
require_relative 'whenua/repository'
require_relative 'whenua/collection'
