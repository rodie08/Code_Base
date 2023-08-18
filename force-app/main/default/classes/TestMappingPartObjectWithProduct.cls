@isTest
private class TestMappingPartObjectWithProduct {
    @isTest static void testBatchJob() {
        // Create test Part__c records
        List<Part__c> testParts = new List<Part__c>();
        for(Integer i = 0; i < 10; i++) {
            Part__c part = new Part__c();
            part.Name = 'Test Part ' + i;
            part.Part_Number__c = 'P' + i;
            part.Active__c = true;
            testParts.add(part);
        }
        insert testParts;
        
        // Start the batch job
        Test.startTest();
        MappingPartObjectWithProduct batchJob = new MappingPartObjectWithProduct();
        Database.executeBatch(batchJob);
        

        Test.stopTest();
    }
}