public class TextLWC {
@AuraEnabled(cacheable=true)
    public static list<Account> getAccount(String objectName){
        String query = 'Select Name from '+objectName;
        System.debug(Database.query(query));
        Contact con =new COntact();
        con.LastName='Test Wire method ';
        INSERT con;
        return Database.query(query);
        
    }
@AuraEnabled(cacheable=false)
public static String createContact(String username,String value) {
    try{
         System.debug('createContact called'+username+'  >>>> '+value);
         Contact newContact = new Contact();
         newContact.lastname=username;
         newContact.accountId=value;
         System.debug(newContact);
        insert newContact;
     return newContact.Id;
    }catch(Exception ex){
        System.debug(ex.getMessage());
    }
    return null;
}
@AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact WHERE Title!= null
            LIMIT 10
        ];
    }
}