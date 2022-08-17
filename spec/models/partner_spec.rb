# frozen_string_literal: true

describe Partner do
  it "has a valid factory" do
    expect(create(:partner)).to be_valid
  end
end
