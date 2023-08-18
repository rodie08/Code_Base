public class Account_OnContact {
    // Handler class will create account on Contact if Account is empty on COntact while creating Account
    public static void craeteAccount_OnContact(LIst<Contact> conlist){
        try{
            List<Account> accList= new List<Account>();
            List<Contact> conList1= new List<Contact>();
            List<Contact> conList2= new List<Contact>();
            conList1=conlist;
            conList2.addAll(conlist);
            
            system.debug('conList1:: '+conList1[0]);
            system.debug('conList1:: '+conList2[1]);
            for(Contact con : conlist1){
                if(con.AccountId == null){
                    
                }
            }
            /*for(Contact con : conList){
if(con.AccountId == null){
Account acc = new Account(Name= 'Account on '+con.Name,Phone=con.Phone);
accList.add(acc);
}
}
Database.insert(accList);
*/
        }catch(Exception exp){
            system.debug('Error::: '+exp.getMessage()+ ' line:: '+exp.getLineNumber());
        }
    }
}