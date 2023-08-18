public class UpdateAccountRating {
    public static void updateRating(List<Account> accList){
        try{
            for(Account acc: accList){
                if(acc.Industry =='Banking' || acc.Industry=='Healthcare'){
                    acc.Rating='Hot1';
                }
            }
            system.debug('accList:: '+accList);
        }catch(Exception exp){
            system.debug('Error::: '+exp.getMessage()+ ' line: '+exp.getLineNumber());
        } 
    }

}