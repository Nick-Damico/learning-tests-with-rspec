require 'rails_helper'

RSpec.describe User, type: :model do
  it  'is valid with a first name, last name, email, and password' do
  	user = User.new(
  		first_name: "Kris",
  		last_name: "Motto",
  		email: "tester@example.com",
  		password: "Luck-tester"
  		)
  	expect(user).to be_valid
  end
  it "is invalid without a first name" do
  	user = User.new(first_name: nil)
  	user.valid?

  	expect(user.errors[:first_name]).to_not include("can't be blank")
  end
  it "is invalid without a last name" do
  	user = User.new(last_name: nil)
  	user.valid?

  	expect(user.errors[:last_name]).to_not include("can't be blank")
  end
  it "is invalid without an email" do
  	user = User.new(email: nil)
  	user.valid?

  	expect(user.errors[:email]).to_not include("can't be blank")
  end
  it "is invalid with a duplicate email address" do
  	User.create(
  		first_name: "Kris",
  		last_name: "Motto",
  		email: "tester@example.com",
  		password: "Luck-tester"
  		)

  	user = User.new(
  		first_name: "Johnny",
  		last_name: "Appleseed",
  		email: "tester@example.com",
  		password: "Fruit-picker"
  		)
  	user.valid?
  	expect(user.errors[:email]).to include("has already been taken")
  end
  it "returns a user's full name as a string" do
  	user = User.new(
  		first_name: "Johnny",
  		last_name: "Appleseed",
  		email: "tester@example.com",
  		password: "Fruit-picker"
  		)
  	expect(user.name).to eq("Johnny Appleseed")
  end
end
