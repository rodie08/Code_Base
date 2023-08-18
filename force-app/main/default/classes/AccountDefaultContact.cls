public With Sharing class AccountDefaultContact {
    public static String customerRecordType =Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer').getRecordTypeId();
    public static   Set<Id> accountIdsSet = new Set<Id>();
    public static   Map<Id,Contact> accountIdVSContact = new  Map<Id,Contact>();
    public static   List<Contact> updateContactList = new List<Contact>();
    @AuraEnabled(cacheable=true)
    public static void defaultContact(List<Account> accList){
        try{           
            for(Account acc : accList){
                if(acc.RecordTypeId == customerRecordType && acc.Active__c == 'Yes'){
                    Contact con = new Contact();
                    con.FirstName=acc.Name;
                    con.LastName=' Customer Representative';
                    con.Phone=acc.Phone;
                    con.Email=acc.ompany_Email__c;
                    con.AccountId=acc.Id;
                    updateContactList.add(con);
                }
            }
            system.debug('updateContactList::: '+updateContactList);
            if(!updateContactList.isEmpty() && updateContactList.size() > 0 ){
                Database.insert(updateContactList);
            }
        }catch(Exception exp){
            system.debug('Errro:: '+exp.getMessage()+' Line::: '+exp.getLineNumber());
        }
    }
    @AuraEnabled(cacheable=true)
    public static void defaultContact1(List<Account> accList){
        try{
            
            for(Account acc : accList){
                if(acc.RecordTypeId == customerRecordType && acc.Active__c == 'Yes')
                    accountIdsSet.add(acc.Id);
            }
            system.debug('accountIdsSet:: '+accountIdsSet);
            if(!accountIdsSet.isEmpty()){
                for(Account acc : [SELECT Name ,ompany_Email__c,Phone,(SELECT Id FROM Contacts) FROM Account WHERE ID IN : accountIdsSet ]){
                   system.debug('inside '+acc.Contacts.size());
                    if(acc.Contacts.size() == 0){
                        Contact con = new Contact();
                        con.FirstName=acc.Name;
                        con.LastName=' Customer Representative';
                        con.Phone=acc.Phone;
                        con.Email=acc.ompany_Email__c;
                        con.AccountId=acc.Id;
                        updateContactList.add(con);
                    }
                }
            }
            system.debug('updateContactList::: '+updateContactList);
            if(!updateContactList.isEmpty() && updateContactList.size() > 0 ){
                Database.insert(updateContactList);
            }
        }catch(Exception exp){
            system.debug('Errro:: '+exp.getMessage()+' Line::: '+exp.getLineNumber());
        }
    }
}