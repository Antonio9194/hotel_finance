class Transaction < ApplicationRecord
  enum transaction_type: {income:0, expense:1}
end
