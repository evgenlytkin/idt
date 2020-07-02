# frozen_string_literal: true

module Api
  module V1
    class SitemapController < BaseController
      def index
        root_node = Sitemap.find_by(parent_id: nil)

        respond_to do |format|
          format.json do
            if root_node
              render json: root_node, serializer: Api::V1::SitemapSerializer, status: 200
            else
              render json: { message: "Root node can't be found" }, status: :unprocessable_entity
            end
          end
        end
      end
    end
  end
end
