module Steps
  module Cases
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
  end
end