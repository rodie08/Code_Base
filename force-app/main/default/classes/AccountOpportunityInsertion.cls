public class AccountOpportunityInsertion {
    public static void insertAccountWithOpportunity() {
        // Create an Account record
        Account newAccount = new Account();
        newAccount.Name = 'Sample Account';
        newAccount.Industry = 'Technology';
        // Set other fields as needed

        // Create a child Opportunity record related to the Account
        Opportunity newOpportunity = new Opportunity();
        newOpportunity.Name = 'Sample Opportunity';
        newOpportunity.StageName = 'Prospecting';
        newOpportunity.CloseDate = Date.today().addDays(30);
        // Set other fields as needed

        // Associate the Opportunity with the Account using the AccountId field
        newOpportunity.AccountId = newAccount.Id;

        // Insert both records in a single DML operation using a list
        List<SObject> recordsToInsert = new List<SObject>();
        recordsToInsert.add(newAccount);
        recordsToInsert.add(newOpportunity);

        Database.SaveResult[] insertResults = Database.insert(recordsToInsert, false);

        // Check the results of the insert operation if needed
        for (Database.SaveResult sr : insertResults) {
            if (sr.isSuccess()) {
                System.debug('Record successfully inserted with ID: ' + sr.getId());
            } else {
                for(Database.Error err : sr.getErrors()) {
                    System.debug('Error while inserting record: ' + err.getMessage());
                }
            }
        }
    }
}