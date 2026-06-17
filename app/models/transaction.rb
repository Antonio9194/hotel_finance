class Transaction < ApplicationRecord

  validates :amount, :transaction_type, :category, :date, presence: true

  enum transaction_type: { income: 0, expense: 1 }
  enum category: {
  ota: 0,
  direct_revenue: 1,

  ota_commission: 2,
  pms: 3,
  amenities: 4,
  linen: 5,
  cleaning: 6,
  utilities: 7,
  internet: 8,
  drinks: 9,
  disaster_prevention: 10,
  hr: 11,
  salaries: 12,
  accounting: 13,
  insurance: 14,
  maintenance: 15,
  supplies: 16,
  miscellaneous: 17
}

end