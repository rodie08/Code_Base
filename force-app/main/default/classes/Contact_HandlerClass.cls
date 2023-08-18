public class Contact_HandlerClass {
    public static void check_PrimaryContact(List<Contact> contList){
        try{
            System.debug('contList>>>'+contList);
            List<Id> accID = new List<Id>();
            Map<id, boolean> bool = new map<id,boolean>();
            for(contact c : contList){
                if(c.accountId != null){
                    accID.add(c.accountId);
                }
            }
            System.debug('accID>>>'+accID);
            List<account> accList = [select id, (select id, Primary_Contact__c from contacts where Primary_Contact__c = true) from Account WHERE Id In: accID];
            System.debug('accList>>>'+accList);
            if(!accList.isEmpty()){
                for(account a : accList){
                    bool.put(a.id, a.contacts.size()>0 ? true : false);
                }   
            }
            System.debug('bool>>>'+bool);
            for(Contact c : contList){
                if(bool.get(c.AccountId) == true){
                    c.addError('no more primary fields');
                }
            }
        }catch(Exception ex){
            System.debug('Line> '+ex.getLineNumber()+ '  error ' +ex.getMessage() +' cause '+ex.getCause());
        }
    }
}