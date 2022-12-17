Rails.application.routes.draw do
  root "euclid#result", defaults: { format: 'xml' }
end
