Rails.application.routes.draw do
  post 'output', to: "proxy#output"
  root "proxy#input"
end
