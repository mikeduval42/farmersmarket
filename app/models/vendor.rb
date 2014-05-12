class Vendor
  include Mongoid::Document
  field :name, type: String
  field :stall, type: Integer
  field :owner, type: String
  field :type, type: String
  field :comments, type: String
end
