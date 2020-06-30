# frozen_string_literal: true

module Api
  module V1
    class SitemapSerializer < ActiveModel::Serializer
      DELIMITER_PATH = '/'

      attributes :data

      def data
        fetch_sitemap(object)
      end

      private

      def fetch_sitemap(sitemap_children, parent_id = nil, parent_path = nil)
        element = {}
        element[:path] = sitemap_children.path
        element[:link_name] = sitemap_children.link_name
        element[:path] = element_path(parent_path, sitemap_children)
        element[:id] = element_id(sitemap_children, parent_id)

        if sitemap_children.children.present?
          element[:children] = element_children(sitemap_children, element)
        end

        element
      end

      def element_children(sitemap_children, element)
        collect_arr = []

        sitemap_children.children&.each do |sitemap_child|
          collect_arr << fetch_sitemap(sitemap_child, element[:id], element[:path])
        end

        collect_arr
      end

      def element_id(sitemap_children, parent_id)
        if parent_id.nil?
          sitemap_children.link_name.downcase
        else
          "#{parent_id}.#{sitemap_children.link_name.downcase.tr(' ', '_')}"
        end
      end

      def element_path(parent_path, sitemap_children)
        "#{parent_path}#{delimiter(parent_path)}#{sitemap_children.path}"
      end

      def delimiter(parent_path)
        (parent_path == DELIMITER_PATH || parent_path.nil?) ? '' : DELIMITER_PATH
      end
    end
  end
end
