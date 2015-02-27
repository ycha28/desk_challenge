module Steps
  module Setup
    step "I have some cases, filters, and labels" do
      step "I have some cases"
      step "I have some filters"
      step "I have some labels"
      step "I have some cases associated with my labels"
    end

    step "I have some cases" do
      @test_1 = FactoryGirl.create(:case, subject: 'Test Case #1', priority: 1, status: 'open', message: FactoryGirl.create(:message, body: 'This is the message for case #1'))
      @test_2 = FactoryGirl.create(:case, subject: 'Test Case #2', priority: 9, status: 'open', message: FactoryGirl.create(:message, body: 'This is the message for case #2'))
      @test_3 = FactoryGirl.create(:case, subject: 'Test Case #3', priority: 4, status: 'pending', message: FactoryGirl.create(:message, body: 'This is the message for case #3'))
      @test_4 = FactoryGirl.create(:case, subject: 'Test Case #4', priority: 8, status: 'resolved', message: FactoryGirl.create(:message, body: 'This is the message for case #4'))
      @test_5 = FactoryGirl.create(:case, subject: 'Test Case #5', priority: 2, status: 'resolved', message: FactoryGirl.create(:message, body: 'This is the message for case #5'))
    end

    step "I have some filters" do
      @inbox = FactoryGirl.create(:filter, active: true, name: "Inbox", position: 1)
      @inbox.cases = [@test_1, @test_2, @test_3, @test_4, @test_5]

      @all_cases = FactoryGirl.create(:filter, active: false, name: "All Cases", position: 2)
      @all_cases.cases = [@test_1, @test_2, @test_3, @test_4, @test_5]

      @my_cases = FactoryGirl.create(:filter, active: true, name: "My Cases", position: 3)
      @my_cases.cases = [@test_1, @test_3, @test_5]

      @unresolved_cases = FactoryGirl.create(:filter, active: true, name: "All Unresolved Cases", position: 4)
      @unresolved_cases = [@test_1, @test_2, @test_3]

      @pending_cases = FactoryGirl.create(:filter, active: true, name: "Pending Cases", position: 5)
      @pending_cases.cases = [@test_3]
    end

    step "I have some labels" do
      @escalated = FactoryGirl.create(:label, name: "Escalated")
      @example = FactoryGirl.create(:label, name: "Example")
      @feedback = FactoryGirl.create(:label, name: "Feedback")
      @more_info = FactoryGirl.create(:label, name: "More Info")
      @sample = FactoryGirl.create(:label, name: "Sample Case")
    end

    step "I have some cases associated with my labels" do
      @test_1.labels = [@example, @feedback]
      @test_2.labels = [@escalated]
      @test_3.labels = [@more_info, @sample]
      @test_4.labels = [@sample]
      @test_5.labels = [@example]
    end
  end
end