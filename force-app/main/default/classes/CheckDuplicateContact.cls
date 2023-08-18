public class CheckDuplicateContact {
    public static void dulicateContact(List<Contact> conList){
        try{
            Set<Id> accountIdSet = new Set<Id>();
            Map<Id,Contact> accountIdContactMap = new Map<Id,Contact>();
            for(Contact con : conList){
                if(con.AccountId !=null){
                    accountIdSet.add(con.AccountId); 
                }
            }
            System.debug('accountIdSet:::: '+accountIdSet);
            for(Contact con : [SELECT AccountId FROM Contact WHERE AccountId IN : accountIdSet]){
                if(!accountIdContactMap.containsKey(con.AccountId)){
                    accountIdContactMap.put(con.AccountId,con);
                }
            }
            System.debug('accountIdContactMap:::: '+accountIdContactMap);
            for(Contact con : conList){
                if(accountIdContactMap.containsKey(con.AccountId)){
                    con.AccountId.addError('Duplicate Record');
                }
            }
        }catch(Exception exp){
            system.debug('Error:::: '+exp.getMessage()+ ' line number:::: '+exp.getLineNumber());
        }
    }
}