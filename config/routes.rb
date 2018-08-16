Rails.application.routes.draw do
  get "/invoices", to: "invoices#calculate"
end
