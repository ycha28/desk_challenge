require 'spec_helper'

describe Cases::BackfillData do
  let(:service) { Cases::BackfillData.new }
  let(:cases) { Case.all }

  describe '#perform', :vcr => true do
    context "when no local copies of the cases exist" do
      it "retrieves all of the cases on Desk and creates local copies" do
        service.perform

        expect(cases.reload.count).to eq 3
        expect(cases[0].subject).to eq "Getting Started with Your New Account"
        expect(cases[1].subject).to eq "The Top 3 Features Our Customers Love!"
        expect(cases[2].subject).to eq "Your free support email address has been activated."
      end
    end

    context "when local copies of the cases already exist" do
      it "syncs all of the local copies with the cases on Desk" do
        FactoryGirl.create(:case, service_id: 1)
        FactoryGirl.create(:case, service_id: 2)
        FactoryGirl.create(:case, service_id: 3)
        expect(cases[0].subject).to_not eq "Getting Started with Your New Account"
        
        service.perform
        expect(cases.reload.count).to eq 3
        expect(cases[0].subject).to eq "Getting Started with Your New Account"
        expect(cases[1].subject).to eq "The Top 3 Features Our Customers Love!"
        expect(cases[2].subject).to eq "Your free support email address has been activated."
      end
    end

    context "when the sidekiq workers are running for the cases test", :sidekiq => true do
      before do
        service.perform
        expect(cases.reload.count).to eq 3
      end

      it "backfills the message data for each case" do
        expect(cases[0].message.body).to include("I want to personally thank you for signing up")
        expect(cases[1].message.body).to include("Desk.com makes it easy to WOW your customers")
        expect(cases[2].message.body).to include("Hooray! We sent you a test case")
      end

      it "backfills the labels data for each case" do
        expect(cases[0].labels[0].name).to eq "Sample Case"
        expect(cases[1].labels[0].name).to eq "Sample Case"
        expect(cases[2].labels[0].name).to eq "Example"
      end
    end
  end
end