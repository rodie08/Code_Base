public class UpdateOpportunities_OnAccountHandler {
    public static void updateOppCount_Amount(List<Opportunity> oppList){
        try{
            system.debug('oppList:::: '+oppList);
            Map<Id,List<Opportunity>> accountIdVSOppMap = new Map<Id,List<Opportunity>>();
            map<id,account> accmap = new map<id,account>();
            List<Account> accList = new List<Account>();
            Set<Id>  accountIdSet = new Set<Id>();
            for(Opportunity opp : oppList){
                if(opp.AccountId != null){
                    accountIdSet.add(opp.AccountId);
                }
            }
            system.debug('accountIdSet::::'+accountIdSet);
            for(Account accoObj :[SELECT Total_Opportunities__c,Total_Amount__c,(SELECT Id,name,Amount,AccountId FROM Opportunities)FROM Account WHERE Id IN : accountIdSet ]){
                Account acc = new Account();
                Integer tempAmount=0 ;
                for(Opportunity opp : accoObj.Opportunities){
                    acc.Id=accoObj.Id;
                    acc.Total_Opportunities__c = accoObj.Opportunities.size();
                    system.debug('opp Name ::'+opp.Name+' Amount::: '+opp.Amount);
                    tempAmount +=(Integer)opp.Amount;
                }
                acc.Total_Amount__c=tempAmount;
                accList.add(acc);
            }
            system.debug('accList:::: '+accList);
            
            if(!accList.isEmpty()){
                accmap.putAll(accList);
                DataBase.update(accmap.values());
            }
        }catch(Exception exp){
            system.debug('Error :::: '+exp.getMessage()+' Line NUmber::: '+exp.getLineNumber());
        }
    }
}