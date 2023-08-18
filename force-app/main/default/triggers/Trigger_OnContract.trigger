trigger Trigger_OnContract on Contract (before insert,before update,After delete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            Contract_HandlerClass.update_RelatedAccount(Trigger.new);
        }
    }if(Trigger.isAfter){
        if(Trigger.isDelete){
             Contract_HandlerClass.update_RelatedAccount(Trigger.old);
        }
    }
}