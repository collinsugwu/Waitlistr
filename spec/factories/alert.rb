FactoryBot.define do
    factory :stock_alert do
      stock_symbol_id nil
      high 120
      low  100
      close 110
      date Time.zone.now
    end
end