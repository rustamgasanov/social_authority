module SocialAuthority
  class Api
    attr_reader :access_id, :secret_key, :user_ids, :screen_names

    def initialize(access_id, secret_key)
      @access_id, @secret_key = access_id, secret_key
    end

    def fetch(user_ids = [], screen_names = [])
      @user_ids, @screen_names = user_ids, screen_names

      uri = URI(generate_request_url)
      response = Net::HTTP.get_response(uri)

      if response.code == '200'
        JSON.parse(response.body)['_embedded']
      else
        raise ResponseError, response.body
      end
    end

    private
    def generate_request_url
      timestamp = Time.now.to_i + 500

      url = 'https://api.followerwonk.com/social-authority'
      url << '?'
      url << "user_id=#{ user_ids.join(',') };"
      url << "screen_name=#{ screen_names.join(',') };"
      url << "AccessID=#{ access_id };"
      url << "Timestamp=#{ timestamp };"
      url << "Signature=#{ generate_signature(timestamp) }"
      url
    end

    def generate_signature(timestamp)
      digest = OpenSSL::Digest.new('sha1')
      data = "#{ access_id }\n#{ timestamp }"
      CGI::escape(Base64.strict_encode64(OpenSSL::HMAC.digest(digest, secret_key, data)))
    end
  end
end
