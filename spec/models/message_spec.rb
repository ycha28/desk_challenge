require 'spec_helper'

describe Message do
  it { should belong_to(:case) }
  it { should validate_presence_of(:body) }
end
