# frozen_string_literal: true

require "rails_helper"

describe Api::V1::SitemapController do
  describe "GET #index" do
    subject { get :index, format: :json }

    context "when there is no a root node" do
      it "returns an error" do
        subject

        payload = JSON.parse(response.body)

        expect(payload["message"]).to eq("Root node can't be found")
      end
    end

    context "when there is a root node" do
      let(:root_sitemap) { create(:sitemap) }
      let!(:child_sitemap) do
        create(:sitemap, link_name: "Settings", path: "settings", parent_id: root_sitemap.id)
      end

      it "returns a root node" do
        subject

        payload = JSON.parse(response.body)

        expect(payload["data"]["path"]).to eq("/")
      end

      it "returns correct child node path" do
        subject

        payload = JSON.parse(response.body)

        expect(payload["data"]["children"][0]["path"]).to eq("/settings")
      end

      it "returns correct child node id" do
        subject

        payload = JSON.parse(response.body)

        expect(payload["data"]["children"][0]["id"]).to eq("home.settings")
      end

      it "returns correct child node link_name" do
        subject

        payload = JSON.parse(response.body)

        expect(payload["data"]["children"][0]["link_name"]).to eq("Settings")
      end
    end
  end
end
