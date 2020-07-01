# frozen_string_literal: true

module Api
  module V1
    class SitemapController < ActionController::API
      def index
        root_node = Sitemap.find_by(parent_id: nil)

        if root_node
          render json: root_node, serializer: Api::V1::SitemapSerializer, status: 200
        else
          render json: "Root node can't be found", status: :unprocessable_entity
        end
      end
    end
  end
end
