public class PreventDuplicateAccount {
    private static Boolean isExecuting = false;
    public static void duplicateAccountName(List<Account> accList){
        try{
            if(!isExecuting){
                //isExecuting = true;
                system.debug('PreventDuplicateAccount is running');
                List<Account> accList1 = new List<Account>();
                Set<String> accountName = new Set<String>();
                for(Account acc : accList){
                    acc.AccountNumber='121';
                    accList1.add(acc);
                }
                update accList1;
                
                /*system.debug('accountName:::' +accountName);
Map<Id,Account> accountNameVSAccountMap = new Map<Id,Account>([SELECT Name FROM Account WHERE NAME IN : accountName]);
List<Account> accList1 = [SELECT Name FROM Account WHERE NAME IN : accountName];
system.debug('accountNameVSAccountMap:::' +accountNameVSAccountMap);
if(!accountName.isEmpty()){
//
for(Account acc :accList){
//system.debug('null ::' + accList1.contains(acc.Name));
if(accList1.contains('Rohit Rawat')){
acc.Name.addError('ojaidhjoijdiwj');
}
}   
}
system.debug('accountNameVSAccountMap::::'+accountNameVSAccountMap);
/*for(Account acc : accList){
if(.containsKey(acc.Name)){
// acc.Name.addError('errro on name');
}
}*/
              //  isExecuting = false;
            }
        }catch(Exception exp){
            system.debug('errror::::: '+exp.getMessage()+' line number:::: '+exp.getLineNumber());
        }
    }
    
}