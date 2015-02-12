require 'rails_helper'

describe User do
  # Arrange necessary preconditions and inputs
  let!(:user) { build(:user) }

  it "must have a name" do
    expect(user.name).to eq("Joe")
  end
end

# A user's name is required
# A user's email is required
# A user's password and password_confirmation are required
# A user's password_confirmation must match password
# An unsafe user password should not authenticate
# A safe user password should authenticate
# Two users cannot have the same email