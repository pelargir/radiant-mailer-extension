class Admin::NewsletterSignupsController < ApplicationController
  only_allow_access_to :index,
    :when => [:developer, :admin],
    :denied_message => "You must have admin or developer privileges to execute this action." 
  
  def index
    respond_to do |format|
      format.html { @signups = NewsletterSignup.all }
      format.csv do
        begin
          send_data(NewsletterSignup.all.to_csv,
            :type => "text/csv; charset=utf-8; header=present",
            :filename => "newsletter_signups.csv")
        ensure
          NewsletterSignup.update_all ["exported = ?", true]
        end
      end
    end
  end
end
