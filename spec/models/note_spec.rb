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
    note = Note.create(
      message: nil
      )
    note.valid?
    expect(note.errors[:message]).to include("can't be blank")
  end

  describe '#search' do
    # Second block 
    before do
      @note_1 = @project.notes.create(
        message: "This is my first note.",
        user: @user
        )
      @note_2 = @project.notes.create(
        message: "This is my second note.",
        user: @user
        )
      @note_3 = @project.notes.create(
        message: "First, preheat the oven",
        user: @user
        )
    end

    context 'when a match is found' do

      it "returns notes that match the search term" do

        expect(Note.search("First")).to include(@note_1, @note_3)
      end    

    end

    context 'when a match is not found' do
      it 'returns an empty array if notes do not match search term' do

        expect(Note.search("puppies")).to be_empty
      end
    end

  end # => END OF DESCRIBE BLOCK

end













