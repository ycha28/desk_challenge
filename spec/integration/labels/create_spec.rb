require 'spec_helper'

describe Labels::Create do
  let(:label) { FactoryGirl.create(:label, name: "A new label") }
  let(:service) { Labels::Create.new(label.id) }

  describe '#perform', :vcr => true do
    it 'creates a label on desk that matches the attributes of the local copy' do
      service.perform
      expect(Desk.label(label.reload.service_id).name).to eq label.name
    end

    it 'syncs the service id of the local label with the id of the label on Desk' do
      old_service_id = label.service_id
      service.perform
      expect(old_service_id).to_not eq(label.reload.service_id)
    end
  end
end