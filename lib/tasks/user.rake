namespace :user do
  desc "Sending recurring emails when tasks should be done in 5 days from now"
  task send_reminder: :environment do
    User.all.each do |user|
      @filtered_task = user.tasks.filter do |task|
        task.end_date.day - Date.today.day <= 5
      end
      UserMailer.send_reminder(user_id).deliver_later
    end
  end
end
