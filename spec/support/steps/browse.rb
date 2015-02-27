module Steps
  module Browse
    step "I am on the home page" do
      visit root_path
    end

    step "I visit the home page" do
      visit root_path
    end

    step "I visit the labels page" do
      click_link "Labels"
    end

    step "I press :button" do |button|
      click_button button
    end
  end
end