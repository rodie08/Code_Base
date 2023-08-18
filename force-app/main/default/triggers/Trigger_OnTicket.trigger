trigger Trigger_OnTicket on Ticket__c (before insert,before update) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert ||Trigger.isUpdate){
            Ticket_handlerClass.update_AccountAndContact(Trigger.new);
        }
    }
}