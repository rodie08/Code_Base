public class DonotUpdateAccountRecord {
    public static void restrictEditAccount(List<Account> accList){
        try{
            For(Account acc : accList){
                if(acc.CreatedDate < date.today().addDays(7)){
                    acc.AddError('acbjaicanci');
                }
            }
        }catch(Exception exp){
            
        }
    }
}