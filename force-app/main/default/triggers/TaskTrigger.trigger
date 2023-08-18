/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger TaskTrigger on Task (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        System.debug(' TaskTrigger is invoke ');
        TaskTriggerHandler.preventUserToDeleteTask(Trigger.new);
    }

}