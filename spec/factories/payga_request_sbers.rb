FactoryGirl.define do
  factory :payga_request_sber, :class => 'Payga::Request::Sber' do
    system nil
    amount "9.99"
    description "MyText"
    lang "MyString"
    page_view "MyString"
    json_params "MyText"
  end

end
