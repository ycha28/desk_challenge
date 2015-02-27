module Steps
  module Filters 
    step "I click on a filter" do
      @random_filter = Filter.active.sample
      find('.list-group-item', text: @random_filter.name).click
    end

    step "I should see all of my active filters" do
      Filter.active.pluck(:name).each do |filter_name|
        expect(page).to have_text(filter_name)
      end
    end

    step "I should not see any inactive filters" do
      Filter.inactive.pluck(:name).each do |filter_name|
        expect(page).to_not have_text(filter_name)
      end
    end

    step "I should see all of the cases associated with that filter" do
      @random_filter.cases.each do |desk_case|
        expect(page).to have_text(desk_case.subject)
      end
    end

    step "I should not see any cases not associated with that filter" do
      Case.where.not(id: @random_filter.case_ids).each do |desk_case|
        expect(page).to_not have_text(desk_case.subject)
      end
    end
  end
end
