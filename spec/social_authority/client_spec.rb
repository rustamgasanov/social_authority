describe SocialAuthority::Client do
  let(:user_ids) { Array.new(5) { rand(100) } }
  let(:screen_names) { Array.new(5) { ('a'..'z').to_a.sample(5).join } }

  it { expect(described_class).to respond_to :new }
  it { expect { described_class.new('id', 'key') }.to_not raise_error }

  describe 'available methods' do
    subject { described_class.new('id', 'key') }

    it { expect(subject).to respond_to(:api) }

    it { expect(subject).to respond_to(:fetch) }
    it { expect(subject).to respond_to(:fetch_user_ids) }
    it { expect(subject).to respond_to(:fetch_screen_names) }
  end

  describe '.new' do
    it 'should call SocialAuthority::Api.new with correct arguments' do
      expect(SocialAuthority::Api).to receive(:new).with('id', 'key')
      described_class.new('id', 'key')
    end
  end

  describe '#fetch' do
    it 'should call SocialAuthority::Api#fetch with correct arguments' do
      client = described_class.new('id', 'key')
      expect(client.api).to receive(:fetch).with(user_ids, screen_names)
      client.fetch(user_ids, screen_names)
    end
  end

  describe '#fetch_user_ids' do
    it 'should call SocialAuthority::Api#fetch with correct arguments' do
      client = described_class.new('id', 'key')
      expect(client.api).to receive(:fetch).with(user_ids, [])
      client.fetch_user_ids(user_ids)
    end
  end

  describe '#fetch_screen_names' do
    it 'should call SocialAuthority::Api#fetch with correct arguments' do
      client = described_class.new('id', 'key')
      expect(client.api).to receive(:fetch).with([], screen_names)
      client.fetch_screen_names(screen_names)
    end
  end
end
