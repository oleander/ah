# frozen_string_literal: true

# TODO: Remove
require "spec_helper"

describe Partner do
  it "has a valid factory" do
    expect(create(:partner)).to be_valid
  end
end
