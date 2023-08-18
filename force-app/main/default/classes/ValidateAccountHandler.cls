public class ValidateAccountHandler {
    public static void validateStatus(List<Account> accList){
        try{
            List<Contact> newAccountLineitem = new List<Contact>();
            // newAccountLineitem=[SLECT status,AccountId, Account.Status from newAccountLineitem where accountId IN:accountIdsSet AND status ='Closed']
            Set<Id> accountIdsSet = new Set<Id>();
            Map<Id,Contact> accountIdVsAccountLineitem = new Map<Id,Contact>();
            for(Account acc : accList){
                accountIdsSet.add(acc.Id);
            }
            if(!accountIdsSet.isEmpty()){
                for(Account acc : [SELECT Status__c,(SELECT Status__c from Contacts WHERE Status__c = 'Open' LIMIT 1) FROM Account WHERE Id IN :accountIdsSet ]){
                    if(!accountIdVsAccountLineitem.containskey(acc.id)){
                        accountIdVsAccountLineitem.put(acc.id, acc.Contacts);
                    }
                    //accountIdVsAccountLineitem.get(acc.id).add(acc.AccountLineitems__r)
                }
            }
            for(Account acc : accList){
                if(accountIdVsAccountLineitem.get(acc.id).Status__c == 'Open'){
                    acc.Status__c.addError('Cannot uopdate the staus to closed as associated child record are open');
                }
            }
        }catch(Exception exp){
            system.debug('Errro:: '+exp.getMessage()+' Line::: '+exp.getLineNumber());
        }
    }
}