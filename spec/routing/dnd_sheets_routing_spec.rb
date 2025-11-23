require "rails_helper"

RSpec.describe DndSheetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dnd_sheets").to route_to("dnd_sheets#index")
    end

    it "routes to #new" do
      expect(get: "/dnd_sheets/new").to route_to("dnd_sheets#new")
    end

    it "routes to #show" do
      expect(get: "/dnd_sheets/1").to route_to("dnd_sheets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dnd_sheets/1/edit").to route_to("dnd_sheets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dnd_sheets").to route_to("dnd_sheets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dnd_sheets/1").to route_to("dnd_sheets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dnd_sheets/1").to route_to("dnd_sheets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dnd_sheets/1").to route_to("dnd_sheets#destroy", id: "1")
    end
  end
end
