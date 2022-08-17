# frozen_string_literal: true

RSpec.describe Material do
  describe "#name" do
    it "is unique" do
      material = create(:material)
      expect(material).to be_valid
      material2 = build(:material, name: material.name)
      expect(material2).not_to be_valid
    end
  end

  it "has a valid factory" do
    expect(build(:material)).to be_valid
  end
end
