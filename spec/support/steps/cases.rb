module Steps
  module Cases
    step "I open a case" do
      find('.ng-binding', text: @test_3.subject).click
    end

    step "I change the details of the case" do
      select "Open", from: "status"
      select "5", from: "priority"

      # Select a label from the multiselect dropdown
      find('button.ng-binding').click
      find('span.ng-binding', text: 'Escalated').click

      fill_in "subject", with: "My newly updated case"
      fill_in "description", with: "My new description"
    end

    step "I should see all of my cases" do
      within('.cases-list') do
        Case.all.each do |desk_case|
          expect(page).to have_text(desk_case.subject)
          expect(page).to have_text(desk_case.priority)
          expect(page).to have_text(desk_case.status)
        end
      end
    end

    step "the cases should have the correct labels" do
      within('.cases-list') do
        Case.all.each do |desk_case|
          expect(page).to have_text(desk_case.labels.map(&:name).join(', '))
        end
      end
    end

    step "I should see all of the details of the case" do
      expect(page).to have_text(@test_3.subject)
      expect(page).to have_text(@test_3.message.body)
    end

    step "I should see all of the changes made to my case" do
      within('.cases-list') do
        expect(page).to have_text "My newly updated case"
      end
    end
  end
end