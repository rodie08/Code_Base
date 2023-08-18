trigger Object1_Trigger on Object1__c (before insert) {
    switch on Trigger.operationType {
        when AFTER_INSERT, AFTER_UPDATE {
            //create related records
        }
        when BEFORE_INSERT {
            Object1_Handler.objectConversion(Trigger.new);
        }
        when AFTER_DELETE {
            
        }
        when else {
            //do nothing for AFTER_UNDELETE, BEFORE_DELETE, or BEFORE_UPDATE
        }
    }
}