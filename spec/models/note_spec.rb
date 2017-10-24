require 'rails_helper'

RSpec.describe Note, type: :model do
	before do
		@user = User.create(
  		first_name: "Johnny",
  		last_name: "Appleseed",
  		email: "tester@example.com",
  		password: "Fruit-picker"
  		)
  		@project = @user.projects.create(
  		name: "Test Project",
  		)
	end
	
  it 'is valid with a user, project, and message' do
  	note = Note.create(
  		message: "This is a test",
  		user: @user,
  		project: @project
  		)
  	expect(note).to be_valid
  end

  it 'is invalid without a message' do
  	note = Note.new(message: nil)
  	note.valid?
  	expect(note.errors[:message]).to include("can't be blank")
  end

  it "returns notes that match the search term" do

  	
  	note_1 = project.notes.create(
  		message: "This is my first note.",
  		user: user,
  		)

  	note_2 = project.notes.create(
  		message: "This is my second note",
  		user: user,
  		)

  	note_3 = project.notes.create(
  		message: "Preheat the oven.",
  		user: user
  		)

  	expect(Note.search("message")).to be_empty
  end
end
