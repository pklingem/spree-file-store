class Admin::UploadedFilesController < Admin::BaseController

  def index
    @uploaded_files = UploadedFile.default_order.paginate(:page => params[:page])
  end

  def new
    @uploaded_file = UploadedFile.new
  end

  def create
    @uploaded_file = UploadedFile.new(params[:uploaded_file])
    @uploaded_file.user = current_user
    if @uploaded_file.save
      flash[:notice] = t('file_successfully_uploaded')
      redirect_to admin_uploaded_files_path
    else
      render :action => :new
    end
  end

  def destroy
    @uploaded_file = UploadedFile.find(params[:id])
    if @uploaded_file.delete
      flash[:notice] = t('file_successfully_deleted')
      redirect_to admin_uploaded_files_path
    else
      flash[:error] = t('file_could_not_be_deleted')
      redirect_to admin_uploaded_files_path
    end
  end

  def download
    @uploaded_file = UploadedFile.find(params[:id])
    send_file("#{RAILS_ROOT}/public"+@uploaded_file.public_filename,
      :disposition => 'attachment',
      :encoding => 'utf8',
      :type => @uploaded_file.content_type,
      :filename => URI.encode(@uploaded_file.filename))
  end

end
