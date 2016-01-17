require 'rails_helper'

RSpec.describe Post, type: :model do


  it "has a valid factory" do

    expect(build(:post)).to be_valid

  end

  describe "attribute accessors" do
    #accessors
    #it { expect(post).to have_attr_accessor(:content) }
    #it { expect(post).to have_attr_accessor(:title) }


  end

  describe "ActiveModel validations" do

    # Basic validations
    # Presence
    #it { expect(post).to validate_presence_of(:title) }
    #it { expect(post).to validate_presence_of(:content) }

    # Uniquenes
    #it { expect(post).to validate_uniqueness_of(:tile) }

  end

  describe "ActiveRecord associations" do

    # Associations
    #it { expect(post).to have_many(:tags) }

  end

  # describe "scopes" do
  #   it ".group returns all resorts in group" do
  #
  #   end
  # end

  # describe "public instance methods" do
  #   context "responds to its methods" do
  #   #  it { expect(resort).to respond_to(:) }
  #   end
  #
  #   context "executes methods correctly" do
  #     context "#" do
  #       it "adds mapped distances to resorts" do
  #       end
  #     end
  #   end
  # end
  # describe "public class methods" do
  #   context "responds to its methods" do
  #
  #     #it { expect(Resort).to respond_to(:) }
  #
  #   end
  #
  #   context "executes methods correctly" do
  #     context "self.method" do
  #       end
  #     end
  #   end
  #  end
  #end
end
