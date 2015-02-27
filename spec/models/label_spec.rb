require 'spec_helper'

describe Label do
  it { should have_and_belong_to_many(:cases) }
  it { should validate_presence_of(:name) }

  let(:label) { Label.new }

  describe '#backfill_data' do
    let(:params) do
      Hashie::Mash.new({
        name: Faker::Lorem.word,
        description: Faker::Lorem.sentence
      })
    end

    it "should backfill the label's attributes" do
      expect(label).to receive(:save)
      label.backfill_data(params)
      expect(label.name).to eq params.name
    end
  end
end
