module Steps
  module Labels
    step "I fill in a label name" do
      @label_name = Faker::Lorem.word
      fill_in "label_name", with: @label_name
    end

    step "I should see all of my labels" do
      Label.pluck(:name).each do |name|
        expect(page).to have_text name
      end
    end

    step "I should see my new label" do
      expect(page).to have_text @label_name
    end
  end
end
