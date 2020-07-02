# frozen_string_literal: true

class SitemapElements
  DELIMITER_PATH = '/'

  def initialize(object)
    @object = object
  end

  def fetch
    process(object)
  end

  private

  attr_reader :object

  def process(sitemap_children, parent_id = nil, parent_path = nil)
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
    sitemap_children.children.reduce([]) do |collect_arr, sitemap_child|
      collect_arr << process(sitemap_child, element[:id], element[:path])
    end
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
