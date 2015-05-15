class AdminController < ApplicationController
  http_basic_authenticate_with name: 'peter', password: '12345678' if Rails.env.production?
  layout 'admin'
end