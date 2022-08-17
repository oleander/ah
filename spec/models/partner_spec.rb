require "spec_helper"

RSpec.describe Partner do
  it "has a valid factory" do
    expect(create(:partner)).to be_valid
  end

  describe ".within_radius" do
    context "given a partner" do
      let(:partner) { create(:partner, lng: 0, lat: 0) }
      let(:max_distance) { 157_000 }

      context "when input coordinates are within max distance" do
        subject { described_class.within_radius(max_distance * 2.0, 1.0, 1.0) }

        it { is_expected.to include(partner) }
      end

      context "when input coordinates are outside max distance" do
        subject { described_class.within_radius(max_distance / 2.0, 1.0, 1.0) }

        it { is_expected.not_to include(partner) }
      end
    end
  end
end
