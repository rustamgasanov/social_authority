module SocialAuthority
  class Client
    attr_reader :api

    def initialize(access_id, secret_key)
      @api = Api.new(access_id, secret_key)
    end

    def fetch(user_ids, screen_names)
      api.fetch(user_ids, screen_names)
    end

    def fetch_user_ids(user_ids)
      api.fetch(user_ids, [])
    end

    def fetch_screen_names(screen_names)
      api.fetch([], screen_names)
    end
  end
end
