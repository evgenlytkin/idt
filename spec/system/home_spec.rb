# frozen_string_literal: true

require "rails_helper"

describe "Home", type: :system, js: true do
  describe "when visiting home page" do
    context "when there is an error" do
      it "shows an error message" do
        visit home_index_path

        expect(page).to have_content("Error: Root node can't be found")
      end
    end

    context "when there is content" do
      let(:root_sitemap) { create(:sitemap) }
      let!(:child_sitemap) do
        create(:sitemap, link_name: "Settings", path: "settings", parent_id: root_sitemap.id)
      end

      it "shows current content" do
        visit home_index_path

        expect(page).to have_content("Home")
        expect(page).to have_content("Settings")
      end
    end
  end
end
