require 'spec_helper'

describe Cases::Update do
  describe '#perform', :vcr => true do
    context "when sidekiq workers are not running for the cases update test" do
      let(:desk_case) { FactoryGirl.create(:case, subject: "My newly updated message", service_id: 1, labels: FactoryGirl.create_list(:label, 3)) }

      it "updates the case on Desk to match the local copy's attributes" do
        Cases::Update.new(desk_case.id).perform
        expect(Desk.case(desk_case.service_id).subject).to eq "My newly updated message"
      end
    end

    context "when sidekiq workers are running for the cases update test", :sidekiq => true do
      let(:desk_case) { FactoryGirl.create(:case, status: 'resolved', service_id: 1, labels: FactoryGirl.create_list(:label, 3)) }

      it "updates the case on Desk to match the local copy's attributes and updates the filters locally" do
        FactoryGirl.create(:case, service_id: 2, status: 'open')
        FactoryGirl.create(:case, service_id: 3, status: 'pending')

        Cases::Update.new(desk_case.id).perform
        filter = Filter.find_by(name: "All Unresolved Cases")
        expect(filter.cases).to_not include(desk_case)
      end
    end
  end
end