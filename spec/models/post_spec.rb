require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'test scopes' do
    let(:time1){1.days.ago}
    let!(:post1) {FactoryGirl.create(:post, created_at: time1)}

    let(:time4){4.days.ago} #creating post4 before post2 so if by sorting by id, it will be
    let!(:post4) {FactoryGirl.create(:post, created_at: time4)}

    let(:time2){2.days.ago}
    let!(:post2) {FactoryGirl.create(:post, created_at: time2)}

    let(:time3){3.days.ago}
    let!(:post3) {FactoryGirl.create(:post, created_at: time3)}

    it "created correctly" do
      post1.created_at.should eq time1
      post2.created_at.should eq time2
      post3.created_at.should eq time3
      post4.created_at.should eq time4
    end

    it "newest first scope" do
      Post.newest_first.to_a.should eq [post1, post2, post3, post4]
    end
    it "oldest first scope" do
      Post.oldest_first.to_a.should eq [post4, post3, post2, post1]
    end
  end
end
