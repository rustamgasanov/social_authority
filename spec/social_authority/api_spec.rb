describe SocialAuthority::Api do
  let(:id) { 'id' }
  let(:key) { 'key' }

  it { expect(described_class).to respond_to :new }
  it { expect { described_class.new(id, key) }.to_not raise_error }

  describe 'available methods' do
    subject { described_class.new(id, key) }

    it { expect(subject).to respond_to(:access_id) }
    it { expect(subject).to respond_to(:secret_key) }
    it { expect(subject).to respond_to(:user_ids) }
    it { expect(subject).to respond_to(:screen_names) }

    it { expect(subject).to respond_to(:fetch) }
  end

  describe '.new' do
    subject { described_class.new(id, key) }

    it { expect(subject.access_id).to eql(id) }
    it { expect(subject.secret_key).to eql(key) }
  end

  describe '#fetch' do
    before(:each) { @instance = described_class.new(id, key) }

    context 'API call' do
      before(:each) do
        @response = double({ code: '200', body: JSON.generate('_embedded'=>'data') })

        allow(URI).to receive(:parse).and_return(@uri = double)
        allow(Net::HTTP).to receive(:get_response).with(@uri).and_return(@response)
        allow(@instance).to receive(:generate_signature).and_return('signature')
        allow(Time).to receive_message_chain(:now, :to_i).and_return(0)
      end

      it 'should generate correct url when user_ids and screen_names provided' do
        expect(URI).to receive(:parse).with(
          'https://api.followerwonk.com/social-authority?user_id=111,222,333;' \
            'screen_name=aaa,bbb,ccc;AccessID=id;Timestamp=500;Signature=signature'
        )

        @instance.fetch([111, 222, 333], ['aaa', 'bbb', 'ccc'])
      end

      it 'should generate correct url when only user_ids provided' do
        expect(URI).to receive(:parse).with(
          'https://api.followerwonk.com/social-authority?user_id=111,222,333;' \
            'screen_name=;AccessID=id;Timestamp=500;Signature=signature'
        )

        @instance.fetch([111, 222, 333], [])
      end

      it 'should generate correct url when only screen_names provided' do
        expect(URI).to receive(:parse).with(
          'https://api.followerwonk.com/social-authority?user_id=;' \
            'screen_name=aaa,bbb,ccc;AccessID=id;Timestamp=500;Signature=signature'
        )

        @instance.fetch([], ['aaa', 'bbb', 'ccc'])
      end
    end

    context 'response handling' do
      it 'should return embedded data if response code was 200' do
        @response = double({ code: '200', body: JSON.generate('_embedded'=>'data') })
        allow(URI).to receive(:parse).and_return(@uri = double)
        allow(Net::HTTP).to receive(:get_response).with(@uri).and_return(@response)

        expect(@instance.fetch([], [])).to eql('data')
      end

      it "should raise SocialAuthority::ResponseError if response code wasn't 200" do
        @response = double({ code: '401', body: '401 Unauthorized' })
        allow(URI).to receive(:parse).and_return(@uri = double)
        allow(Net::HTTP).to receive(:get_response).with(@uri).and_return(@response)

        expect { @instance.fetch([], []) }.to raise_error(SocialAuthority::ResponseError, '401 Unauthorized')
      end
    end
  end
end
