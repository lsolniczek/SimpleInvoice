class InvoicePdf < Prawn::Document
	 
  def initialize(invoice)
	super()
	@invoice = invoice
 
	define_grid(:columns => 5, :rows => 8, :gutter => 10)
	#--logo--#
	logo
	move_down 15

	#--invoice number--#
	grid(0,4).bounding_box do
		inv_number
	end

	#--from--#
	grid([1,0],[1,1]).bounding_box do
		inv_from
	end

	#--to--#
	grid([1,2],[1,3]).bounding_box do
		inv_to
	end

	#--dates--#
	grid(1,4).bounding_box do
		dates
	end

	#--description--#
	grid([2,0],[2,5]).bounding_box do
		description
	end

	#--lines--#
	lines_table

	#---totals--#
	total_show

	#--payment_description--#
	pay_description
  end

#-------------------------------------------------------------------------#

  def logo
  	image @invoice.image.path, :width => 150
  end

  def inv_number
	text "Number ##{@invoice.number}", :align => :right
  end

  def inv_from
  	move_down 20
  	font("Helvetica", :size => 6) do
		text "FROM"
	end
	move_down 5
  	font("Helvetica", :size => 12, :style => :bold) do
		text "#{@invoice.from.name}"
	end
	move_down 5
	font("Helvetica", :size => 10) do
		text "#{@invoice.from.email}"
	end
	move_down 5
	font("Helvetica", :size => 10) do
		text "#{@invoice.from.more_info}"
	end
	move_down 15
  end

  def inv_to
  	move_down 20
	  	font("Helvetica", :size => 6) do
			text "TO"
		end
	move_down 5
	  	font("Helvetica", :size => 12, :style => :bold) do
			text "#{@invoice.to.name}"
		end
	move_down 5
		font("Helvetica", :size => 10) do
			text "#{@invoice.to.email}"
		end
	move_down 5
		font("Helvetica", :size => 10) do
			text "#{@invoice.to.more_info}"
		end
	move_down 15
  end

  def dates
  	move_down 20
	  	font("Helvetica", :size => 6) do
			text "Date issued"
		end
	move_down 5
	  	font("Helvetica", :size => 10) do
			text "#{@invoice.date_issued}"
		end
	move_down 10
		font("Helvetica", :size => 6) do
			text "Payment due"
		end
	move_down 5
		font("Helvetica", :size => 10) do
			text "#{@invoice.payment_due}"
		end
  	move_down 15
  end

  def description
  	move_down 20
	  	font("Helvetica", :size => 6) do
			text "DESCRIPTION"
		end
	move_down 5
  	font("Helvetica", :size => 10) do
  		text "#{@invoice.description}"
  	end
  end

  def lines_table
  	move_down 10
	table lines do
		self.column_widths = {0 => 220, 1 => 60, 2 => 60, 3 => 60, 4 => 60, 5 => 80}
		columns(1..5).align = :right
		cells.border_width = 0.5
		row(0).columns(0..5).font_style = :bold
		row(0).columns(0..5).font_size = 9
		row(0).columns(0..5).background_color = "#428bca"
	end
  end

  def total_show
  	move_down 10
  	totals
  end

  def pay_description
  	y_position = cursor

  	font("Helvetica", :size => 8) do
  		text_box "#{@invoice.payment_description}", :at => [0, y_position - 80], :width => 540
  	end
  end

  



  private

  def lines
  	font("Helvetica", :size => 8)
  	[["Product/Service", "Unit", "Unit value", "Quantity", "VAT", "Total"]] + 
	@invoice.lines.map do |line|
		["#{line.product_description}", "#{line.unit}", "#{line.unit_value}", "#{line.quantity}", "#{line.vat_value} %", "#{line.line_total}"]
	end
  end

  def totals
  	y_position = cursor

  	font("Helvetica", :size => 8) do
  		text_box "Sybtotal #{@invoice.subtotal}", :at => [450, y_position - 20]
  	end
  	font("Helvetica", :size => 8) do
  		text_box "Total VAT #{@invoice.total_vat}", :at => [450, y_position - 40]
  	end
  	font("Helvetica", :size => 10, :font_style => :bold) do
  		text_box "Total #{@invoice.total}", :at => [450, y_position - 60]
  	end
  end

end