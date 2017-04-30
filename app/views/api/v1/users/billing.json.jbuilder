  json.array! @billings do |billing|
    json.extract! billing, :id, :BillingInfoCardNumber, :BillingInfoCvv, :BillingInfoBankName, :BillingInfoBankBranch
end
