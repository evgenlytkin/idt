# frozen_string_literal: true

class Sitemap < ApplicationRecord
  self.table_name = 'sitemap'

  validates :link_name, presence: true, uniqueness: true
  validates :path, presence: true, uniqueness: true
  validate :parent_is_set_properly?

  belongs_to :parent, class_name: 'Sitemap', foreign_key: :parent_id, optional: true
  has_many :children, class_name: 'Sitemap', foreign_key: :parent_id

  def parent_is_set_properly?
    return if parent_id.nil? || parent.present?

    errors.add(:base, "Invalid parent_id")
  end
end
