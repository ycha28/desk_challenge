require 'spec_helper'

describe Case do
  it { should have_one(:message) }
  it { should have_and_belong_to_many(:filters) }
  it { should have_and_belong_to_many(:labels) }

  let(:desk_case) { Case.new }

  describe '#backfill_data' do
    let(:params) do
      Hashie::Mash.new({
        id: rand(1000),
        blurb: Faker::Lorem.sentence,
        subject: Faker::Lorem.sentence,
        priority: rand(1..9),
        description: Faker::Lorem.sentence,
        status: ['open', 'pending', 'resolved'].sample,
        updated_at: Time.now
      })
    end

    it "should backfill the case's attributes" do
      expect(desk_case).to receive(:save)
      desk_case.backfill_data(params)
      expect(desk_case.service_id).to eq params.id
    end
  end

  describe '#backfill_message_data' do
    it "should start a worker to retrieve the case's message" do
      expect(Messages::BackfillDataWorker).to receive(:perform_at)
      desk_case.backfill_message_data
    end
  end

  describe '#backfill_label_data' do
    let(:labels) { [double('Label 1'), double('Label 2')] }

    it "should associate the case with the labels sent in the params" do
      Label.stub_chain(:where, :service_id) { labels }
      expect(desk_case).to receive(:labels=) { labels }
      desk_case.backfill_label_data([1, 2, 3])
    end
  end
end
