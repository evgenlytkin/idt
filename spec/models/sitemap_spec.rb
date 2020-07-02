# frozen_string_literal: true

require "rails_helper"

describe Sitemap do
  describe "validations" do
    it "validates link_name is unique on create" do
      create(:sitemap, link_name: "Home")

      expect(build(:sitemap, link_name: "Home")).to_not be_valid
    end

    it "validates path is unique on create" do
      create(:sitemap, path: "/")

      expect(build(:sitemap, path: "/")).to_not be_valid
    end

    context "validates parent_id on create" do
      it "it considers a new entry as a valid" do
        root_path = create(:sitemap, link_name: "Home", path: "/")

        expect(build(:sitemap, link_name: "Settings", path: "settings", parent: root_path)).to be_valid
      end

      it "it doesn't consider a new entry as a valid" do
        expect(build(:sitemap, link_name: "Settings", path: "settings", parent_id: "invalid")).not_to be_valid
      end
    end
  end
end
