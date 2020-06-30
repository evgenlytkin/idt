# frozen_string_literal: true

class Sitemap < ApplicationRecord
  self.table_name = 'sitemap'

  has_many :children, class_name: 'Sitemap', foreign_key: :parent_id, dependent: :destroy
end
