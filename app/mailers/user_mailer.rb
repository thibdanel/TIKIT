class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_reminder.subject
  #
  def send_reminder
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Vous avez des tâches à effectuer !')
  end

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end

  def create_confirmation
    @task = params[:task]

    mail(
      to:       @task.user.email,
      subject:  "Vous avez #{@task.count} tâches en attente!"
    )
  end
end
