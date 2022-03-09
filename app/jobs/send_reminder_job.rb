class SendReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

  end

  # Itérer sur tous les utilisateurs
  # Pour chacun des utilisateurs récupérer les tâches se terminant dans 5 jours ou moins
  # Stocker ces tâches dans un array
  # Planifier l'envoi d'un mail pour le jour suivant
  # Placer ce job dans une rake task qui pourra être lancé par le heroky scheduler


  # Pour ce qui est de la récurence on va utiliser des rake tasks
  # Créer un job qui se lancera toutes les 24h
  # Dans ce job, nous lancerons la rake task que nous avons defini au préalable
  # Cette rake task va appeler une methode du controller pour récupérer toutes les tâches dans la condition que nous souhaitons
  # Cette méthode enverra également les mails à 1 min d'intervale
end
