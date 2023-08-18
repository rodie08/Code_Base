public class StatefulBatchJob implements Database.Batchable<sObject>, Database.Stateful{
    
    public integer summary;
    
    public StatefulBatchJob(String q){
        Summary = 0;
    }
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id,Name,(SELECT Id,AccountId,Account.name FROM Contacts WHERE AccountId !=null) FROM Account LIMIT 500 FOR UPDATE';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC,List<Account> scope){
        system.debug('scope::::'+scope.size());
        
        for(Account s : scope){
            // system.debug('scope::::'+s.Contacts.size());
            for(Contact c : s.Contacts)
            {
                if(c.AccountId != null){
                    system.debug('Contact::::'+s.Contacts.size());
                    Summary ++;  
                }
            }
        }
        system.debug('Summary::::'+Summary);
    }
    public void finish(Database.BatchableContext BC){
    }
}