public class DonotDeleteClosedOpportunity {
    public static void restrictUser(List<Opportunity> oppList){
        try{
            User adminUser = [SELECT Id ,Name , UserRole.Name,Profile.name from User WHERE Profile.name ='System Administrator' LIMIT 1];
            
            for(Opportunity opp : opplist){
                if(opp.StageName == 'Closed Won' && UserInfo.getUserId() != adminUser.Id){
                    opp.addError('ncihichihc iacih');
                }
            }
            
        }catch(Exception exp){
            system.debug('error::: '+exp.getMessage()+' line:: '+exp.getLineNumber());
            
        }
    }
    
}