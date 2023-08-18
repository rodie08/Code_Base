/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 05-23-2023
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger LeadTrigger on Lead (after insert,after update,before insert,before update) {
    
    switch on Trigger.operationtype{
        when BEFORE_INSERT,BEFORE_UPDATE{
            CreateSalesProcess.craeteAccount_Contact_Opportunity(trigger.new);
        }
         when AFTER_INSERT,AFTER_UPDATE{
           LeadTriggerHandler.sendEmail(Trigger.new);  
        }
         when BEFORE_DELETE{
            
        }
    }
}