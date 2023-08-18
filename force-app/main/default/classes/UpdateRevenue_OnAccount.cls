public class UpdateRevenue_OnAccount {
    
    public static void updateRevenue(List<Account> accList){
        try{
            Set<String> accountIds = new Set<String>();
            
            for(Account acc : accList){
                accountIds.add(acc.Id);
                
                /* switch on acc.Industry{
when 'Banking'{
acc.AnnualRevenue =1000;
}
when 'Finance'{
acc.AnnualRevenue =2000;
}
when 'Insurance'{
acc.AnnualRevenue =3000;
}
when 'Healthcare'{
acc.AnnualRevenue =4000;
}
when else{
acc.AnnualRevenue = 0000;
}
}
}*/
                
            }
            Map<Id,Contact> accountIdVSContact = new Map<Id,Contact>();
            for(Contact con : [SELECT AccountId from Contact WHERE AccountId IN : accountIds]){
                if(!accountIdVSContact.containsKey(con.Id)){
                    accountIdVSContact.put(con.AccountId,con);
                }
            }
            system.debug('accountIdVSContact:: '+accountIdVSContact);
            for(Account acc : accList){
                if(accountIdVSContact.containsKey(acc.Id)){
                    acc.AddError('Associates with Contact');
                }
            }
        }catch(exception ex){
            system.debug('Error: '+ ex.getMessage()+ ' line '+ex.getLineNumber());  
        }
    }
}