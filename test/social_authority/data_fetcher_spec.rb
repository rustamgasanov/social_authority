require_relative '../test_helper'

describe SocialAuthority::DataFetcher do
  subject { SocialAuthority::DataFetcher }

  it { subject.must_respond_to :new }
end
