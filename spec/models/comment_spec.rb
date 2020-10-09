require 'rails_helper.rb'
require './app/models/comment.rb'
RSpec.describe Comment, type: :model do
  let(:user) {User.new}
  let(:post) {Post.new}
  let(:comment) {Comment.create}
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_length_of(:content) }
    it { should validate_presence_of(:content) }
  end
end