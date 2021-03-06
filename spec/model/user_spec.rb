require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_length_of(:password).is_at_least(2).is_at_most(10) }

end
