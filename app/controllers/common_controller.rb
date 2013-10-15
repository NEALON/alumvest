class CommonController < ApplicationController
  skip_before_filter :authenticate

  def filepicker
    @ckeditor = params['CKEditor']
    @funcNum = params['CKEditorFuncNum']
    response = FilepickerApi.store(params['upload'].tempfile)
    @url = response['url']
    render :layout => false
  end
end
