class Product < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true, numericality: { only_integer: true }

end
