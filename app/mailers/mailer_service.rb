class MailerService < ActionMailer::Base
  default from: "ecoelcar@gmail.com"

  def track_publication_send_confirmation(email, subject = "Has publicado una ruta", track) 
    @track = track
    mail(to: email, subject: subject)
  end

  def booking_confirmation_to_owner(email, subject = "Has hecho una reserva", booking)
    @booking = booking
    mail(to: email, subject: subject)
  end

  def booking_confirmation_to_passenger
  end
end
