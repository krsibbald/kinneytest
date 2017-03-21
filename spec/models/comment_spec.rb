require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'test scopes' do
    let!(:post){FactoryGirl.create(:post)}

    let(:time1){1.days.ago}
    let!(:comment1) {FactoryGirl.create(:comment, post: post, created_at: time1)}

    let(:time4){4.days.ago} #creating comment 4 before comment 3, so if sorting by id, it will be more obvious
    let!(:comment4) {FactoryGirl.create(:comment, post: post, created_at: time4)}

    let(:time2){2.days.ago}
    let!(:comment2) {FactoryGirl.create(:comment, post: post, created_at: time2)}

    let(:time3){3.days.ago}
    let!(:comment3) {FactoryGirl.create(:comment, post: post, created_at: time3)}

    it "created correctly" do
      comment1.created_at.should eq time1
      comment2.created_at.should eq time2
      comment3.created_at.should eq time3
      comment4.created_at.should eq time4
    end

    it "newest first scope" do
      post.comments.newest_first.to_a.should eq [comment1, comment2, comment3, comment4]
    end
    it "oldest first scope" do
      post.comments.oldest_first.to_a.should eq [comment4, comment3, comment2, comment1]
    end
  end
end
