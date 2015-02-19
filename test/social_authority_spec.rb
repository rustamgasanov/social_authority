require_relative 'test_helper'

describe SocialAuthority do
  include SocialAuthority

  it { must_respond_to :fetch }
  it { must_respond_to :fetch_user_ids }
  it { must_respond_to :fetch_screen_names }
end
