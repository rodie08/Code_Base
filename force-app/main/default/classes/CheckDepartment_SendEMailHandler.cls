public class CheckDepartment_SendEMailHandler {
    public static void sendEmail(List<Contact> conList){
        try{
            for(Contact con : conList){
                if(con.Department == 'Sales'){
                    Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
                    String[] sendingTo = new String[]{con.Email};
                        semail.setToAddresses(sendingTo);
                    semail.setSubject(con.Name+' Update is update the department  ');
                    semail.setPlainTextBody('Hello!!!!!!!!!! This is a test email to test single email message program');
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});
                }
            }
        }catch(Exception exp){
            system.debug('Error:::: '+exp.getMessage()+' line number::: '+exp.getLineNumber());
        }
    }
}