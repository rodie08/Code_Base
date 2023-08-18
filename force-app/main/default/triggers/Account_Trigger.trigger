trigger Account_Trigger on Account (before insert,before update,before delete,after insert) {
    
    switch on Trigger.OperationType  {
        when BEFORE_UPDATE
        {
            AccountDefaultContact.defaultContact1(Trigger.new);
            //ValidateAccountHandler.validateStatus(trigger.new);
            // PermissionClass.permissionMethod();
            //DonotUpdateAccountRecord.restrictEditAccount(Trigger.new);
            //UpdateRevenue_OnAccount.updateRevenue(trigger.new);
            //UpdateAccountRating.updateRating(trigger.new);
            // PreventDuplicateAccount.duplicateAccountName(Trigger.new);
            // Account_HandlerClass.check_Contract(Trigger.new);
            // CreateContact_OnAccount.createContact_RealatedAccount(Trigger.new);
        }when AFTER_INSERT
        { AccountDefaultContact.defaultContact(Trigger.new);
         // Contact_QuckBooksCustomer_Handler.create_QuickCustomer(Trigger.new);
        }when BEFORE_DELETE
        {
            // UpdateRevenue_OnAccount.updateRevenue(trigger.old);
            
        }when AFTER_UPDATE{
            for (Account a : Trigger.new)
            {
                if(a.OwnerId != Trigger.oldMap.get(a.ID).OwnerId)
                {
                    //CreateContact_OnAccount.update_ContactOwner(Trigger.new);
                }
            }
        }
    }
}