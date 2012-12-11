# encoding: utf-8

require 'bundler/setup'
require 'sinatra'
require 'json'

STATIC_DIR = File.join(File.dirname(__FILE__), 'static')

module AcaoFont
  class App < Sinatra::Base
    get '/font/*' do
      headers 'Access-Control-Allow-Origin' => '*'

      path = params[:splat].first
      font_path = File.expand_path(path, STATIC_DIR)
      content = File.read(font_path)

      content
    end
  end
end
