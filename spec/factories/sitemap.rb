# frozen_string_literal: true

FactoryBot.define do
  factory :sitemap do
    link_name { "Home" }
    path { "/" }
    parent_id { nil }
  end
end
