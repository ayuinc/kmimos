ActiveAdmin.register Meeting do
  #  id              :integer          not null, primary key
  #  provider_id     :integer
  #  user_first_name :string(255)
  #  user_last_name  :string(255)
  #  user_phone      :string(255)
  #  user_email      :string(255)
  
  permit_params :provider, :user_id

  controller do 
    
    def show
      @meeting = Meeting.where(token: params[:id]).last
      render :show
    end
    
    def destroy
      @meeting = Meeting.where(token: params[:id]).last
      @meeting.destroy
      redirec_to action: :index
    end

    def edit
      @meeting = Meeting.where(token: params[:id]).last
      render :edit
    end
  end
end
