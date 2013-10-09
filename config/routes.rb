SimpleInvoice::Application.routes.draw do

root 'invoices#index'

resources :invoices

get '/send' => 'send_invoice#send_invoice', :as => 'send_invoice' 

end
