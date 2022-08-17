# frozen_string_literal: true

require "spec_helper"

describe Request do
  it "has a valid factory" do
    expect(build(:request)).to be_valid
  end

  describe "#partners" do
    subject(:request) { create(:request) }

    let(:material1) { create(:material) }
    let(:material2) { create(:material) }

    # Distance in meters between request and partner
    # when request is at (0, 0) and partner is at (1, 1)
    let(:max_distance) { 157_426 }

    context "when there are no partners" do
      it { is_expected.to have_attributes(partners: be_empty) }
    end

    context "when partner lives inside of the request location" do
      let(:partner) { create(:partner, lng: request.lng, lat: request.lat) }

      context "when partners does not contain a subset of required materials" do
        before do
          create(:requirement, request:, material: material1)
          create(:experience, partner:, material: material2)
        end

        it { is_expected.not_to have_attributes(partners: include(partner)) }
      end

      context "when partners does contain a subset of required materials" do
        before do
          create(:requirement, request:, material: material1)
          create(:experience, partner:, material: material1)
          create(:experience, partner:, material: material2)
        end

        it { is_expected.to have_attributes(partners: include(partner)) }
      end
    end

    context "when partner lives outside of the request location" do
      subject(:request) { create(:request, lat: 0, lng: 0) }

      let(:partner) { create(:partner, lat: 1, lng: 1, operating_radius: max_distance / 2.0) }

      context "when partners does contain a subset of required materials" do
        before do
          create(:requirement, request:, material: material1)
          create(:experience, partner:, material: material1)
          create(:experience, partner:, material: material2)
        end

        it { is_expected.not_to have_attributes(partners: include(partner)) }
      end
    end

    context "when partner lives outside of the request location" do
      subject(:request) { create(:request, lat: 0, lng: 0) }

      let(:partner) { create(:partner, lat: 1, lng: 1, operating_radius: max_distance * 2.0) }

      context "when partners does contain a subset of required materials" do
        before do
          create(:requirement, request:, material: material1)
          create(:experience, partner:, material: material1)
          create(:experience, partner:, material: material2)
        end

        it { is_expected.to have_attributes(partners: include(partner)) }
        it { is_expected.to have_attributes(partners: all(have_attributes(distance: be_within(1.0).of(max_distance)))) }
      end
    end
  end
end
