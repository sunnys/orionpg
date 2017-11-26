class TransactMailer < ApplicationMailer
    default :from => 'notification@orionit.com'

    def request_for_approval(user, transact)
        @user = user
        @manager = @user.employee.managers.last.user
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}/approve" 
        mail(:to => @manager.email, :subject => "Request for travel approval : #{@user.email}")
    end

    def approve_transaction_notification(user, transact)
        @user = user
        @transact = transact
        @manager = @user.employee.managers.last.user
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}/book" 
        mail(:to => @user.email, :subject => "Your travel request has been approved by : #{@manager.name}") 
    end

    def reject_transaction_notification(user, transact)
        @user = user
        @transact = transact
        @manager = @user.employee.managers.last.user
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}" 
        mail(:to => @user.email, :subject => "Your travel request has been rejected by : #{@manager.name}") 
    end
   
    def book_transaction_notification(user, transact)
        @user = user
        @transact = transact
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}/book" 
        mail(:to => @user.email, :subject => "You are booking transaction #{@transact.id}") 
    end

    def otp_generation(user, transact, otp)
        @user = user
        @transact = transact
        @otp = otp
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}/book" 
        mail(:to => @user.email, :subject => "Orionit Transactio alert: Otp #{otp} generated")
    end

    def valid_otp(user, transact, otp)
        @user = user
        @transact = transact
        @otp = otp
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}" 
        mail(:to => @user.email, :subject => "Orionit Transactio alert: Otp verification successful")
    end

    def invalid_otp(user, transact, otp)
        @user = user
        @transact = transact
        @otp = otp
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}" 
        mail(:to => @user.email, :subject => "Orionit Transactio alert: Otp verification unsuccessful")
    end

    def successful_transaction_notification(user, transact)
        @user = user
        @transact = transact
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}/successful" 
        mail(:to => @user.email, :subject => "Orionit Transactio alert: Transaction #{@transact.id} Successful")
    end

    def failed_transaction_notification(user, transact)
        @user = user
        @transact = transact
        @url = "#{Rails.application.class.config.client_host_url}/transactions/#{transact.id}/failed" 
        mail(:to => @user.email, :subject => "Orionit Transactio alert: Transaction #{@transact.id} Successful")
    end
end
