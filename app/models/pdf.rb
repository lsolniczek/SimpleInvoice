class Invoice_pdf < Prawn::Document
 
  def initialize(invoice, view)
    super()
    text "This is an order invoice"
  end
end