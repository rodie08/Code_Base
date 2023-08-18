public class Ticket_handlerClass {
    public static void update_AccountAndContact(List<Ticket__c> ticketList){
        try{
            System.debug('ticketList>>>'+ticketList);
            Set<Id> accoundId = new Set<Id>(); 
            Set<Id> contactId = new Set<Id>();
            List<Contact> contactList = new List<Contact>();
            Map<id,Contact> accIdVsContact = new Map<id,Contact>();
            for(Ticket__c tObj : ticketList){
                if(tObj.Company__c != null){
                    accoundId.add(tObj.Company__c);
                }if(tObj.Contact__c != null){
                    contactId.add(tObj.Contact__c);
                }
            }
            if(!accoundId.isEmpty() || !contactId.isEmpty()){
                contactList=[SELECT AccountId, Primary_Contact__c 
                             FROM Contact 
                             WHERE Primary_Contact__c=True 
                             AND (AccountId IN :accoundId OR ID IN :contactId)];
            }
            System.debug('contactList>>>'+contactList);
            if(!contactList.isEmpty()){
                for(Contact con : contactList){
                    if(!accIdVsContact.containsKey(con.AccountId)){
                        accIdVsContact.put(con.AccountId, con);
                    }
                }
                System.debug('Account ID>>>'+accIdVsContact);
                if(accIdVsContact.size() > 0){
                    for(Ticket__c tObj : ticketList){
                        System.debug('Contact ID>>>'+accIdVsContact.get(tObj.Company__c).Id);
                        tObj.Contact__c=accIdVsContact.get(tObj.Company__c).Id;
                        tObj.Company__c=accIdVsContact.get(tObj.Company__c).AccountId;
                    }   
                }
                System.debug('Ticket Account Id>>>'+ticketList[0].Company__c);
                System.debug('Ticket Contact Id>>>'+ticketList[0].Contact__c);
            }
            else{
                for(Contact con : contactList){
                    con.addError('Contact is not a Main Contact');
                }
            }
            
            
        }catch(Exception ex){
            System.debug('Line> '+ex.getLineNumber()+ '  error ' +ex.getMessage() +' cause '+ex.getCause());
        }
    }
}