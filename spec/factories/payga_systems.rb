FactoryGirl.define do
  factory :payga_system, :class => 'Payga::System' do
    default false
    base "MyString"
    username "MyString"
    password "MyString"
    pathes "MyText"
    merchant "MyString"
  end

end
