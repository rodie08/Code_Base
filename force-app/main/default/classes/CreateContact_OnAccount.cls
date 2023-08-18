public class CreateContact_OnAccount {
    
    public static void createContact_RealatedAccount(List<Account> acclList){
        try{
            Contact con;
            if(acclList!=null && !acclList.isEmpty()){
                for(Account acc : acclList){
                    con = new Contact();
                    con.AccountId=acc.Id;
                    con.LastName=acc.Name+' Update by Account Trigger';
                }
            }
            System.debug('con>>>'+con);
            if(con!= null){
                Database.insert(con);
            }
        }catch(Exception ex){
            System.debug('Line no._'+ex.getLineNumber()+' '+'error->'+ex.getMessage());
        }
    }
    public static void update_ContactOwner(List<Account> acclList){
        try{
            Set<Id> accIds = new Set<Id> ();
            Map<ID,List<Contact>> accountIdVSContactList = new Map<ID,List<Contact>>();
            List<Contact> conList= new List<Contact>();
            List<Contact> updateConList = new List<Contact>();
            if(acclList!=null && !acclList.isEmpty()){
                for(Account acc : acclList){
                    accIds.add(acc.Id);
                }
            }
            System.debug('accIds>>>'+accIds);
            if(accIds!=null && !accIds.isEmpty()){
                conList = [SELECT AccountId,OwnerId FROM Contact WHERE AccountId IN: accIds];
            }
            System.debug('conList>>>'+conList);
            if(conList!=null && !conList.isEmpty()){
                for(Contact con : conList){
                    // con.OwnerId = Trigger.newMap.get(con.AccountId).OwnerId;
                }
            }
            /*if(conList!=null && !conList.isEmpty()){
                for(Contact con : conList){
                    if(!accountIdVSContactList.containsKey(con.AccountId)){
                        accountIdVSContactList.put(con.AccountId, new List<Contact>());
                    }
                    accountIdVSContactList.get(con.AccountId).add(con);
                }
            }
            System.debug('accountIdVSContactList>>>'+accountIdVSContactList);
            if(acclList!=null && !acclList.isEmpty() && accountIdVSContactList.size() > 0){
                for(Account acc : acclList){
                    for(Contact con : accountIdVSContactList.get(acc.Id)){
                        con.OwnerId = acc.OwnerId;
                        updateConList.add(con);
                    }
                }
            }*/
            if(conList!=null && !conList.isEmpty()){
                UPDATE conList;
            }
        }catch(Exception ex){
            System.debug('Line no._'+ex.getLineNumber()+' '+'error->'+ex.getMessage());
        }
    }
}