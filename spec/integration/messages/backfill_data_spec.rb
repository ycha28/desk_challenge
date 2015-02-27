require 'spec_helper'

describe Messages::BackfillData do
  let(:service) { Messages::BackfillData.new(desk_case.id) }

  describe '#perform', :vcr => true do
    context "when a case already has a message" do
      let(:desk_case) { FactoryGirl.create(:case, service_id: 1, message: FactoryGirl.create(:message)) }

      it "syncs the case's data with the remote case's data on Desk" do
        service.perform
        expect(desk_case.reload.message.body).to include("I want to personally thank you for signing up to try Desk.com! To ensure")
        expect(desk_case.message.remote_created_at).to eq "2015-02-22 20:56:12"
      end
    end

    context "when a case does not yet have a message" do
      let(:desk_case) { FactoryGirl.create(:case, service_id: 1) }

      it "creates a message associated with the case that is identical to the remote case's message on Desk" do
        service.perform
        expect(desk_case.message.body).to include("I want to personally thank you for signing up to try Desk.com! To ensure")
        expect(desk_case.message.remote_created_at).to eq "2015-02-22 20:56:12"
      end
    end
  end
end