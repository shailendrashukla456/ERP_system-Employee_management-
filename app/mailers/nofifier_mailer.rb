class NofifierMailer < ApplicationMailer
    def new_account(recipient)
        mail(
            to:  recipient,
            subject:  "New Account information",
            
        )
    end
end
