public class OpportunityTriggerHandler {
    
    public static void copyClientContact(List<Opportunity> oppList){
        try {
            system.debug('oppList::::: '+oppList);
            Account newAccount = new Account();            
            for(Opportunity opp : oppList){
                if(opp.Client_Contact__c != null){
                    newAccount.id=opp.AccountId;
                    newAccount.Client_Contact__c=opp.Client_Contact__c;
                }
            }
            Update newAccount;
        } catch(Exception e) {
            System.debug('Errro::: '+e.getMessage()+' line:::: '+e.getLineNumber());
        }
    }
}