public class Account_HandlerClass {
    public static void check_Contract(List<Account> accLIst){
        try{
            Set<Id> accountId= new Set<Id>();
            Set<Id> InactiveAccountId= new Set<Id>();
            List<Contract> contractList = new List<Contract>();
            List<Ticket__c> ticketList = new List<Ticket__c>();
            List<Account> update_AccountList = new List<Account>();
            System.debug('accLIst>>>'+accList);
            for(Account acc : accList){
                accountId.add(acc.Id);
                if(acc.Client_Status__c == 'Inactive'){
                    InactiveAccountId.add(acc.Id);
                }
            }
            contractList=[SELECT Id,AccountId, Status FROM Contract WHERE Status='Activated' AND AccountId =:accountId LIMIT 1] ;
            SyStem.debug('contractList>>>'+contractList);
            if(contractList.isEmpty()){
                for(Account acc :accLIst){
                    if(acc.Client_Status__c =='Active'){
                        system.debug('inside for if');
                        acc.addError('Account '+acc.Name+' Status cannot be Active as it has no Active SLA');
                    }
                    else if(acc.Client_Status__c =='Inactive'){
                        ticketList=[SELECT ID,OwnerId,Inquiry_type__c
                                    FROM Ticket__c 
                                    WHERE Company__c IN : InactiveAccountId 
                                    AND Inquiry_Status__c ='Open'];
                    }
                    if(!ticketList.isEmpty()){
                        User Communication_HeadUser =[SELECT Id,name, UserRoleId 
                                                      FROM User 
                                                      WHERE UserRole.Name='Communication Head'];
                        User Headware_HeadUser =[SELECT Id,name, UserRoleId 
                                                 FROM User 
                                                 WHERE UserRole.Name='Hardware Head'];
                        system.debug('aCommunication_HeadUser>>>'+Communication_HeadUser);
                        system.debug('Headware_HeadUser>>>'+Headware_HeadUser);
                        for(Ticket__c tObj: ticketList){
                            if(tObj.Inquiry_type__c =='Communication'){
                                tObj.OwnerId=Communication_HeadUser.Id;
                            }else{
                                tObj.OwnerId=Headware_HeadUser.Id;
                            }
                        }
                    }
                    system.debug('after changesticketList>>>'+ticketList);
                    if(!ticketList.isEmpty()){
                        update ticketList;
                    }
                }
                
            }/*else if(!contractList.isEmpty()){
Account accObj = new Account();
accObj.id=contractList[0].AccountId;
accObj.Client_Status__c='Active';
accLIst.add(accObj);
}*/
            
        }catch(Exception ex){
            System.debug('Line> '+ex.getLineNumber()+ '  error ' +ex.getMessage() +' cause '+ex.getCause());
        }
    }
}