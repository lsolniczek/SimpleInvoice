class InvoiceMailer < ActionMailer::Base
  default from: "l.solniczek@gmail.com"

  	def invoice(invoice)
	  inv = InvoicePdf.new(invoice)
	  attachments["invoice.pdf"] = { :mime_type => 'application/pdf', :content => inv.render }
	  mail(:to => "#{invoice.to.email}", :subject => "Your Invoice")
	end
end
