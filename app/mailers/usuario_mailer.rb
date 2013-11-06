class UsuarioMailer < ActionMailer::Base
  default from: "noreply@proyectotea.com"

  def bloqueado_comisaria_email(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: 'Tu usuario ha sido bloqueado en TEA')
  end

  def desbloqueado_comisaria_email(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: 'Tu usuario ha sido desbloqueado en TEA')
  end

end
