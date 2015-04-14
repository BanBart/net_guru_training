require 'spec_helper'

describe Review do
  describe 'validations' do
    it { should validate_presence_of :content }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
  end
  
  describe '#user' do
    let(:user){ create(:user) }
    let(:user2) { create(:user) }
   # let(:product) { create(:product) }
    let(:review1) { create(:review, rating: 2, user: user) }
    let(:review2) { create(:review, rating: 3, user: user2) }
    
   # before do
    #  product.reviews << [review1, review2]
   # end
    
    it 'is assigned as owner' do 
      expect(review1.user).to eq(user)
      expect(review2.user).to eq(user2)
    end
    
    it 'is not assigned as owner' do
      expect(review1.user).to_not eq(user2)
    end
  end
end
