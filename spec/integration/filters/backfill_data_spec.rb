require 'spec_helper'

describe Filters::BackfillData do
  let(:service) { Filters::BackfillData.new }
  let(:filters) { Filter.all }

  describe '#perform', :vcr => true do
    context "when no local copies of the filters exist" do
      it "retrieves all of the filters on Desk and creates local copies" do
        service.perform

        expect(filters.reload.count).to eq 10
        expect(filters[0].name).to eq "Inbox"
      end
    end

    context "when local copies of the filters already exist" do
      it "syncs all of the local copies with the filters on Desk" do
        [2310370, 2310372, 2310373, 2310374, 2310375, 2310376, 2310377, 2310378, 2310371, 2310369].each do |service_id|
          FactoryGirl.create(:filter, service_id: service_id)
        end
        expect(filters[0].name).to_not eq "Inbox"

        service.perform

        expect(filters.reload.count).to eq 10
        expect(filters[0].name).to eq "Inbox"
      end
    end

    context "when the sidekiq workers are running during the filters test", :sidekiq => true do
      it "backfills the cases data for each filter" do
        case_1 = FactoryGirl.create(:case, service_id: 1)
        case_2 = FactoryGirl.create(:case, service_id: 2)
        case_3 = FactoryGirl.create(:case, service_id: 3)
        service.perform

        expect(filters.reload.count).to eq 10
        expect(filters[0].cases).to include(case_1)
        expect(filters[0].cases).to include(case_2)
        expect(filters[0].cases).to include(case_3)
      end
    end
  end
end