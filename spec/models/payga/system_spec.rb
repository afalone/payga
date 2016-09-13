require 'rails_helper'

module Payga
  RSpec.describe System, type: :model do
    subject { FactoryGirl.create(:payga_system) }
    describe 'request' do
      it 'should return sber class' do
        expect(subject.request).to eq Request::Sber
      end
    end 
    describe 'status' do
      # let :request, {  }

      # it 'should '
    end
  end
end
