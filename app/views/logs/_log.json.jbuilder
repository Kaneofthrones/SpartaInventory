json.extract! log, :id, :item_id, :return_date, :lender, :borrower, :returned_to, :created_at, :updated_at

json.url log_url(log, format: :json)