class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  has_many :images, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_cost
  belongs_to :seller, class_name: "User", optional: true, foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", optional: true, foreign_key: "buyer_id"
  enum status: {
    出品中: 0,
    売却済み: 1
  }
  validates_associated :images
  validates :images, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :region_id, presence: true
  validates :preparation_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :user_id, presence: true
  validates :category_id, presence: true
end
