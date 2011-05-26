require 'sinatra/base'
class TestApp < Sinatra::Base

  set :views, File.dirname(__FILE__) + '/test_app_views'

  get '/' do
    erb :home
  end

  get '/congratulations' do
    @redirected = params.has_key?("redirected")
    erb :congratulations
  end

  get '/other/page' do
    redirect to('/congratulations?redirected=true')
  end

  get '/form/page' do
    erb :form
  end

  get '/form/submit' do
    erb :form_result
  end

end

TestApp.run! unless defined?(Cucumber)
