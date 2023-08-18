public class UdpateAccountRatingHandler {
    
    public static void updateRatingField(List<Opportunity> oppList){
        try{
            Account acc;
            for(Opportunity opp : oppList ){
                if(opp.StageName == 'Closed Won' && opp.AccountId != null){
                    acc = new Account(Id = opp.AccountId,Rating='Hot');
                }
            }
            system.debug('accc: '+acc);
            Database.update(acc);
        }catch(Exception exp){
            system.debug('error ::: '+exp+' line number::: '+exp.getLineNumber());
        }
    }
}