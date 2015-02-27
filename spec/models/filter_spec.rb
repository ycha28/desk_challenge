require 'spec_helper'

describe Filter do
  it { should have_and_belong_to_many(:cases) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:position) }

  let(:filter) { Filter.new }

  describe '#backfill_data' do
    let(:params) do
      Hashie::Mash.new({
        name: Faker::Lorem.word,
        active: [true, false].sample,
        position: rand(1..100)
      })
    end

    it "should backfill the filter's attributes" do
      expect(filter).to receive(:save)
      filter.backfill_data(params)
      expect(filter.name).to eq params.name
    end
  end

  describe '#backfill_cases_data' do
    it "should start a worker to retrieve the filter's cases" do
      expect(Filters::BackfillCasesDataWorker).to receive(:perform_at)
      filter.backfill_cases_data
    end
  end
end
