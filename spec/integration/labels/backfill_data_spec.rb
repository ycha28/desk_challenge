require 'spec_helper'

describe Labels::BackfillData do
  let(:service) { Labels::BackfillData.new }
  let(:labels) { Label.all }

  describe '#perform', :vcr => true do
    context "when no local copies of the labels exist" do
      it "retrieves all of the labels on Desk and creates local copies" do
        service.perform

        expect(labels.reload.count).to eq 9
        expect(labels[0].name).to eq "Abandoned Chats"
      end
    end

    context "when local copies of the labels already exist" do
      it "syncs all of the local copies with the filters on Desk" do
        [2400545, 2400544, 2400541, 2400539, 2400540, 2400543, 2409968, 2400542, 2400538].each do |service_id|
          FactoryGirl.create(:label, service_id: service_id)
        end 

        expect(labels[0].name).to_not eq "Abandoned Chats"
        service.perform
        expect(labels.reload.count).to eq 9
        expect(labels[0].name).to eq "Abandoned Chats"
      end
    end
  end
end