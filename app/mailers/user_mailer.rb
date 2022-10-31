class UserMailer < ApplicationMailer
	default from: 'shibudimitri1699@gmail.com'


	def email_notification()
		
	
	
	   		mail(to: 'shibushaw1699@gmail.com', subject: 'Total Leave from the users......!!!' )
	
	end
end
