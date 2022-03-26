# == Schema Information
#
# Table name: restaurants
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  address      :string           not null
#  description  :text
#  rating       :float
#  review_count :integer
#  price_rating :string
#  hours        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Restaurant < ApplicationRecord

  validates :name, :address, :hours, presence: true  

  has_one :menu,
    foreign_key: :restaurant_id,
    class_name: :Menu

  has_many :menu_items,
    through: :menu,
    source: :menu_items

  has_one_attached :photo
    
end
