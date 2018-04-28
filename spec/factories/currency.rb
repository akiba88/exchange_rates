FactoryGirl.define do
  factory :currency do
    parent_code 'R01235'
    num_code '000'
    char_code 'TEST'
    name '$'
    eng_name '$'
    value 60.0
    forced_value 1000.0
    forced_expiriation_at 10.minutes.since
  end
end
