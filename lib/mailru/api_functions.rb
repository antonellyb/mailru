module MailRu

  module ApiFunctions
    
    def functions
      %w(audio.get
         audio.link
         audio.search
         audios.top
         events.getNewCount
         friends.get
         friends.getAppUsers
         friends.getInvitationsCount
         friends.getOnline
         guestbook.get
         guestbook.post
         mail.getUnreadCount
         messages.getThread
         messages.getThreadsList
         messages.getUnreadCount
         messages.post
         mobile.getCanvas
         notifications.send
         payments.openDialog
         photos.createAlbum
         photos.get
         photos.getAlbums
         photos.upload
         stream.comment
         stream.get
         stream.getByAuthor
         stream.like
         stream.post
         stream.share
         stream.unlike
         users.getBalance
         users.getInfo
         users.hasAppPermission
         users.isAppUser
         widget.set) 
    end

    def ruby_name(name)
      name.gsub(/([a-z\d])([A-Z])/,'\1_\2').tr('.', '_').downcase
    end

  end

end
