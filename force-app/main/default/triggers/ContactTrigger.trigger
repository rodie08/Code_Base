/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 05-23-2023
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
    switch on Trigger.operationType {  
        when AFTER_INSERT, AFTER_UPDATE {
            
        }
        when BEFORE_INSERT,BEFORE_UPDATE {
            //Account_OnContact.craeteAccount_OnContact(trigger.new);
            //CheckDuplicateContact.dulicateContact(Trigger.new);
            //CheckDepartment_SendEMailHandler.sendEmail(Trigger.new);
            //RestrictUserForCreatingContact.twoContactPerAccount(Trigger.new);
            for(Contact con : Trigger.new ){
                if(con.Email != null || con.Phone != null){
                    //ContactHandler.validateDuplicate(Trigger.new);
                }
            } 
        }
        when AFTER_DELETE {
            
        }
        when else {
            
        }
    }
}