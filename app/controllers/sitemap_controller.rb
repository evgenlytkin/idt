# frozen_string_literal: true

class SitemapController < ActionController::API
  def index
    root_node = Sitemap.find_by(parent_id: nil)

    render json: root_node, serializer: Api::V1::SitemapSerializer, status: 200
  end
end
