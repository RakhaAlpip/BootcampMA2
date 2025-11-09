class Email{
  void sendEmail(String msg) {
    print('Sending Email: $msg');
  }
}

class NotifEmail {
  final Email _email = Email();

  void sendNotif(String msg) {
    _email.sendEmail(msg);
  }
}

class sendEmail {
  final Email email;

  SendEmail({reqiored this.email});

  void send(String msg) {
    email.sendEmail(msg);
  }
}

void main() {
  NotifEmail notifEmail = NotifEmail();
  notifEmail.sendNotif('Ini adalah notifkasi email.');
  
}