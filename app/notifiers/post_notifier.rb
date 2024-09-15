class PostNotifier < ApplicationNotifier
  
  

  deliver_by :email do |config|
    config.mailer = "UserMailer"
    config.method = "new_post"
    config.params = ->(recipient) {{user:recipient}}
    config.wait = 5.minutes 
  end

  def message
    "This is my foo:  #{params[:foo]}" 
  end 

  notification_methods do 
     def message
      " #{recipient.profile_name} Add New Post  :  #{params[:foo]}" 
    end 
  end 

  # deliver_by :database

  # param :post, :commenter

  # def message
  #   "#{params[:commenter].profile_name} commented on your post."
  # end

  # def url
  #   post_path(params[:post])
  # end



  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message
end
