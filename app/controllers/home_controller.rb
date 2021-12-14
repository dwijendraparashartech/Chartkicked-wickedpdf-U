
class HomeController < ApplicationController
  def index
  end

  def pdf
    # this method will be called by Dhalang
  end

  def convert
    _url = request.base_url + pdf_path
    _pdf = Dhalang::PDF.get_from_url(_url)
    _file_name = "Report" 
        File.open("#{Rails.root}/public/#{_file_name}.pdf", "w+b") << _pdf
  redirect_to "/#{_file_name}.pdf"
  end
end
