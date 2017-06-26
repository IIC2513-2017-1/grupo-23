class UserMailer < ApplicationMailer
   def new_user_email(user)
     @user = user
     mail subject: "Haz creado una cuenta en Super campeones: #{@user.full_name} su token de api es #{@user.token}", to: @user.email
   end
   def new_seguidor_email(team, seguidor)
     @userd = team.dueno
     @users = seguidor
     @team = team
     mail subject: "se ha unido un nuevo usuario a tu equipo #{team.name}", to: @userd.email
   end
 end