require 'avatax'

# Header Level Elements
# Required Header Level Elements
AvaTax.configure_from 'credentials.yml'

taxSvc = AvaTax::TaxService.new

cancelTaxRequest = {
    # Required Request Parameters
    :CompanyCode => "APITrialCompany",
    :DocType => "SalesInvoice",
    :DocCode => ARGV[0],
    :CancelCode => "DocVoided"
    }

cancelTaxResult = taxSvc.cancel(cancelTaxRequest)

# Print Results
puts "CancelTaxTest ResultCode: "+cancelTaxResult["ResultCode"]
if cancelTaxResult["ResultCode"] != "Success"
  cancelTaxResult["Messages"].each { |message| puts message["Summary"] }
end
