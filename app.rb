# encoding: utf-8

require 'bundler/setup'
require 'sinatra'
require 'json'

STATIC_DIR = File.join(File.dirname(__FILE__), 'static')

module AcaoFont
  class App < Sinatra::Base
    get '/font/:font_name' do
      headers 'Access-Control-Allow-Origin' => '*'

      begin
        font_name = (params[:font_name] || '').gsub(%r#(/|[.][.])#, '')
        font_path = File.join(STATIC_DIR, 'font', font_name)
        ext = File.extname(font_path)

        case ext
        when '.svg'
          content_type 'image/svg+xml'
        end

        content = File.read(font_path)
        content
      rescue Errno::ENOENT
        puts 'Not Found'
        halt 404
      end
    end
  end
end
