require 'spec_helper'
require 'sosick/utils'

describe Sosick::Utils do
  it { should be_true }
end

describe Sosick::Utils::Validator do
  it "should return true" do
    Sosick::Utils::Validator::validate_arguments("production") eq(true)
  end
end
