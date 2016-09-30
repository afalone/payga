require 'rails_helper'

module Payga
  RSpec.describe System, type: :model do
    before do
      @sys = FactoryGirl.create(:payga_system)
    end
    describe '#request' do
      it 'should return sber class' do
        expect(@sys.request).to eq Request::Sber
      end
    end 
    describe '#status' do
      it 'should find request' do
        # expect

      end
      # let :request, {  }

      # it 'should '
    end

    describe '#pay_for' do
      before do
        @request = FactoryGirl.create :payga_request_sber
      end
      it 'should setup urls' do
        expect(@sys.request).to receive(:create).with(hash_including(amount: 1, callback_url: 'back', success_url: 'succ', fail_url: 'fail')).and_return(@request)
        allow(@request).to receive(:pay)
        expect(@sys.pay_for(1, '', {callback: 'back', success: 'succ', fail: 'fail'})).to eq [@request.id, @request.form_url, @request.error_code]
      end

        
    end
  end
end
