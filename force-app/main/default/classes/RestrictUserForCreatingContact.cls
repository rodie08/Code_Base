public class RestrictUserForCreatingContact {
    
    public static void twoContactPerAccount(List<Contact> conList){
        try{
            Set<Id> accountIdSet = new Set<Id>();
            for(Contact con : conList){
                if(con.AccountId != null){
                    accountIdSet.add(con.AccountId);
                    //con.addError('cscs');
                }
            }
            System.debug('accountIdSet::::' +accountIdSet);
            if(accountIdSet.size() > 0 && !accountIdSet.isEmpty()){
                for(Account acc : [SELECT Id,(Select Id, AccountId FROM Contacts) FROM Account WHERE Id IN : accountIdSet]){
                    system.debug('acc.Contacts.size() :::'+acc.Contacts.size());
                    if(acc.Contacts.size() > 2){
                    //   acc.addError('Error');  
                    }
                }
            }
        }catch(Exception exp){
            system.debug('Error:::: '+exp.getMessage()+' line number::: '+exp.getLineNumber());
        }
    }
}