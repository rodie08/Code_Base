public class DeleteMessgaeLogBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        //String recordDate = Date.today().addDays(-30);
        String query ='SELECT Name FROM Message_Logger__c WHERE CreatedDate ='+String.valueOf(date.today().AddDays(28));
         return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<sObject> scope){
        try{
            if(!scope.isEmpty()){
                Database.delete(scope);
            }
        }catch(Exception exp){
            system.debug('error:: '+exp.getLineNumber());
        }
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}