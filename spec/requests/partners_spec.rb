# frozen_string_literal: true

require "spec_helper"

describe PartnersController, type: :controller do
  let(:json) { JSON(response.body) }

  describe "GET /partners/:id" do
    let(:partner) { create(:partner) }

    before do
      get :show, params: { id: partner.id }
    end

    it "returns a partner" do
      expect(json).to include({
        "id" => partner.id,
        "operating_radius" => be_a(Integer),
        "rating" => be_a(Integer),
        "lng" => be_a(String),
        "lat" => be_a(String)
      })
    end

    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /requests/:request_id/partners" do
    let(:request) { create(:request) }

    # Valid partners within range
    let(:p1) { create(:partner, lng: request.lng, lat: request.lat, operating_radius: 100_000, rating: 1) }
    let(:p2) { create(:partner, lng: request.lng, lat: request.lat, operating_radius: 100_000, rating: 5) }

    # Slightly futher away, but still within range
    let(:p3) { create(:partner, lng: request.lng + 0.01, lat: request.lat, operating_radius: 100_000, rating: 5) }

    # Outside of operating radius
    let(:p4) { create(:partner, lng: request.lng * 2, lat: request.lat * 2, operating_radius: 100_000) }

    before do
      [p1, p2, p3, p4].each do |partner|
        request.materials.each do |material|
          create(:experience, partner:, material:)
        end

        # Ensures the request contains a subset of the partner's materials
        create(:experience, partner:)
      end

      # Missing materials, but within range
      create(:partner, lng: request.lng, lat: request.lat, operating_radius: 100_000)
    end

    before do
      get :index, params: { request_id: request.id }
    end

    it "returns a list of matching partners" do
      expect(json.size).to eq(3)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end

    it "sorts the partners by distance & rating" do
      expect(json[0]["id"]).to eq(p2.id)
      expect(json[1]["id"]).to eq(p3.id)
      expect(json[2]["id"]).to eq(p1.id)
    end
  end
end
