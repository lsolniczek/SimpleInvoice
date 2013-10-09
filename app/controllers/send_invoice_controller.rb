class SendInvoiceController < ApplicationController
	def send_invoice
    @invoices = Invoice.all

    @invoices.each do |invoice|
      InvoiceMailer.invoice(invoice).deliver
    end
    
    redirect_to root_url, notice: 'Invoice was successfully delivered.'
  end
end
