require 'spec_helper'

describe PrismicMiddleman::Core do
  subject { described_class.new Middleman::Application }
  let(:options) { subject.options }

  before(:each) do
    PrismicMiddleman.instance_variable_set(:@prismic_middleman_instances, [])
  end

  describe 'options' do
    it 'defaults' do
      expect(options.repository).to eq(nil)
      expect(options.access_token).to eq(nil)
      expect(options.query).to eq({})
    end
  end

  describe 'hooks' do
    describe '#after_configuration' do
      before do
        options.repository = { fake_name: 'id' }
      end

      it 'updates repository data from original hash' do
        subject.after_configuration

        expect(options.repository).to eq({ fake_name: "id" })
      end

      it 'sets up instances' do
        expect(PrismicMiddleman.instances.size).to eq(0)

        subject.after_configuration

        expect(PrismicMiddleman.instances.size).to eq(1)
      end
    end
  end
end
