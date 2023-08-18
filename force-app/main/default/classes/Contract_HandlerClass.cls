public class Contract_HandlerClass {
    
    public static void update_RelatedAccount(List<Contract> contractList){
        try{
            System.debug('Trigger type>>>'+Trigger.OperationType);
            System.debug('contractList>>>'+contractList);
            Set<Id> accountId= new Set<Id>();
            List<Contract> newContractList = new List<Contract>();
            List<Account> update_AccountList = new List<Account>();
            for(Contract con : contractList){
                if(con.Status=='Activated'){
                    accountId.add(con.AccountId);
                }
            }
            System.debug('accountId>>>'+accountId);
            newContractList=[SELECT Id,AccountId, Status 
                             FROM Contract
                             WHERE Status='Activated' 
                             AND AccountId IN : accountId 
                            ];
            System.debug('newContractList>>>'+newContractList);
            if(newContractList.isEmpty()){
                //if(newContractList[0].Status != 'Activated'){
                Account accObj = new Account();
                accObj.id=contractList[0].AccountId;
                accObj.Client_Status__c='Inactive';
                update_AccountList.add(accObj); 
                //}
            }
            if(!newContractList.isEmpty()){
                if(newContractList[0].Status== 'Activated'){
                    Account accObj = new Account();
                    accObj.id=newContractList[0].AccountId;
                    accObj.Client_Status__c='Active';
                    update_AccountList.add(accObj);  
                }
            }
            System.debug('update_AccountList>>'+update_AccountList);
            if(!update_AccountList.isEmpty()){
                update update_AccountList;
            }
        }catch(Exception ex){
            system.debug('Line> '+ex.getLineNumber()+' error '+ex.getMessage());
        }
    }
}