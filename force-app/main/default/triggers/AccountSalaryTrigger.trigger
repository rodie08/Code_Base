trigger AccountSalaryTrigger on Account_Salary__c (before insert,before update,before delete,after undelete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            
        }
        if(Trigger.isInsert){
            
        }
    }
}