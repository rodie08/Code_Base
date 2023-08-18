//"Create a Custom field on Account - Recently Added (Lookup - Contact).
//Write an Apex script to fill the field with latest created contact record in Account relation."
public class Update_LatestContact {
    
    public static void find_LatestContact(){
        try{
            Set<Id> accountIdSet = new Set<Id>();
            Map<Id,Contact> accountIdVsContact = new Map<Id,Contact>();
            List<Account> updateAccountList = new List<Account>();
            List<Account> accountList =[SELECT Id,
                                        (SELECT Id,Name,AccountId,CreatedDate FROM Contacts WHERE AccountId!= null ORDER BY CreatedDate DESC LIMIT 1)
                                        FROM Account];
            
            for(Account accObj : accountList){
                if(!accountIdVsContact.containsKey(accObj.Id)){
                    accountIdVsContact.put(accObj.Id,accObj.Contacts);
                }
            }
            system.debug('accountIdVsContact'+accountIdVsContact);
            if(accountIdVsContact != null && accountIdVsContact.size() > 0){
              for(Account accObj : accountList){
                accObj.Recently_Added__c=accountIdVsContact.get(accObj.Id).Id;
                updateAccountList.add(accObj);
            }   
            }
           
            /*for(Account accObj : accountList){
                for(Contact con : accObj.Contacts){
                    if(con.AccountId != null){
                        accObj.Recently_Added__c=con.Id;
                        updateAccountList.add(accObj);
                    }
                }
            }*/
            system.debug('before updateAccountList>>'+updateAccountList);
            if(!updateAccountList.isEmpty()){
              UPDATE updateAccountList;
                //List<sObjet> = Database.Update(updateAccountList);
            }
        }catch(Exception ex){
            System.debug('Error>> '+ex.getMessage()+' on line-> '+ex.getLineNumber());
        }
    }
}