class Order < ApplicationRecord
   include ActiveModel::Model
   belongs_to :users
   has_one :address
end

