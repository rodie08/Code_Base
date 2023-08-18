public class AccountWithContact {
    public static void getAccountWithContact(){
        try{
            for(Account acc : [Select Name , (Select Name from Contacts) from account]){
                //system.debug('acc name>> '+ acc.Name +' contact count '+ acc.Contacts.size());
            }
            Map<Id,Contact> accountIdVSContactMap = new Map<Id,Contact>([Select AccountId,Name from Contact]);
            for(Contact con : accountIdVSContactMap.values()){
                if(con.AccountId != null){
                    accountIdVSContactMap.put(con.AccountId ,con);
                }
            }
            List<Contact> conList = [Select AccountId,Name from Contact];
            Map<Id,List<Contact>> accountIdVSContactListMap = new Map<Id,List<Contact>>();
            for(Contact con : conList ){
                if(!accountIdVSContactListMap.containsKey(con.AccountId)){
                    accountIdVSContactListMap.put(con.AccountId, new List<Contact>());
                }else{
                    accountIdVSContactListMap.get(con.AccountId).add(con);
                }
            }
            system.debug('account Id >>>>'+accountIdVSContactListMap.values());
            for(List<Contact> con : accountIdVSContactListMap.values() ){
               // system.debug('account Id >>>>'+con.AccountId+' con>>'+con);
            }
            //system.debug('accountIdVSContactListMap>>'+accountIdVSContactMap);
            
        }catch(Exception ex){
            system.debug('error>>>'+ex.getMessage()+' line >'+ex.getLineNumber());
        }
    }
    
}