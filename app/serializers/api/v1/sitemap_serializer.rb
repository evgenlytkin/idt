# frozen_string_literal: true

module Api
  module V1
    class SitemapSerializer < ActiveModel::Serializer
      attributes :data

      def data
        SitemapElements.new(object).fetch
      end
    end
  end
end
