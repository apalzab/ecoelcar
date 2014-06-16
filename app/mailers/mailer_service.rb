class MailerService < ActionMailer::Base
  default from: "ecoelcar@gmail.com"
  helper TracksHelper

  def track_publication_send_confirmation(email, subject = "Has publicado una ruta", track) 
    @track = track
    mail(to: email, subject: subject)
  end

  def booking_confirmation(email, subject = "Has hecho una reserva", booking)
    @booking = booking
    mail(to: email, subject: subject)
  end

  def booking_price_update_notification(email, subject = "Viajar juntos es más barato", booking, old_price)
    @booking = booking
    @old_price = old_price
    mail(to: email, subject: subject)
  end
end
