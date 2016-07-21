FactoryGirl.define do
  factory :payga_receipt_sber, :class => 'Payga::Receipt::Sber' do
    request nil
order "MyString"
form_url "MyString"
error_code "MyString"
error_message "MyString"
json_params "MyText"
  end

end
