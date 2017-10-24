require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'does not allow a User to have duplicate project names per user' do
  		user = User.create(
  			first_name: "Joe",
  			last_name:  "Tester",
  			email:      "joe@example.com",
  			password:   "TesterJoe"
  			)
  		user.projects.create(name: "Test Project")
  		new_project = user.projects.build(
  			name: "Test Project"
  			)
  		new_project.valid?
  		expect(new_project.errors[:name]).to include("has already been taken")
  end

  it 'allows two Users to share the same project name' do
  	user = User.create(
  			first_name: "Joe",
  			last_name:  "Tester",
  			email:      "joe@example.com",
  			password:   "TesterJoe"
  			)
  			user.projects.create(name: "Test Project")
  			other_user = User.create(
  				first_name: "Amy",
  				last_name: 	"Tester",
  				email: 		"amy@example.com",
  				password: 	"TesterAmy"
  				)
  			other_project = other_user.projects.build(
  				name: "Test Project"
  				)
  			other_project.valid?
  			expect(other_project).to be_valid
  end
end
