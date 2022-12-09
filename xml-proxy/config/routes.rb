Rails.application.routes.draw do
  get 'output', to: "proxy#output"
  root "proxy#input"
end
