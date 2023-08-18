trigger OpportunityTrigger on Opportunity (before insert,before update) {
    
    switch on Trigger.operationType{
        when AFTER_INSERT, AFTER_UPDATE{
            for(opportunity opp :Trigger.new){
                if(opp.Client_Contact__c != null){
                    OpportunityTriggerHandler.copyClientContact(Trigger.new);
                }
            }
        }when BEFORE_INSERT,BEFORE_UPDATE{
            UpdateOpportunities_OnAccountHandler.updateOppCount_Amount(Trigger.new);
            UdpateAccountRatingHandler.updateRatingField(Trigger.new);
        }when BEFORE_DELETE{
            //UpdateOpportunities_OnAccountHandler.updateOppCount_Amount(Trigger.new);
            DonotDeleteClosedOpportunity.restrictUser(trigger.old);
        }
        when else{
            
        }
    }
}