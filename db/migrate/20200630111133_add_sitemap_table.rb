# frozen_string_literal: true

class AddSitemapTable < ActiveRecord::Migration[6.0]
  def change
    create_table :sitemap do |t|
      t.string :link_name
      t.string :path
      t.integer :parent_id, default: nil

      t.timestamps
    end
  end
end
