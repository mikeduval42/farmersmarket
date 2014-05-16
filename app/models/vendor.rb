class Vendor
  include Mongoid::Document
  field :name, type: String
  field :stall, type: Integer
  field :owner, type: String
  field :type, type: String
  field :comments, type: String
  validates_presence_of :name, :stall, :owner, :type, :comments, message: "One or more of the fields were not filled out."
end
