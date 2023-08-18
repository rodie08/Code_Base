import { LightningElement, wire, api, track } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import testLms from '@salesforce/messageChannel/Test_LMS__c';

export default class Publish extends LightningElement {

    @wire(MessageContext)
    messageContext;


    addHandleClick(evt) {
        console.log('addHandleClick>>>');
        const counterValue = {
            operator: 'Add',
            constant: 1,
            message: ''
        };
        publish(this.messageContext, testLms, counterValue);
    }
    subsHandleClick(evt) {
        console.log('subsHandleClick>>>');
        const counterValue = {
            operator: 'substract',
            constant: 1,
            message: ''
        };
        publish(this.messageContext, testLms, counterValue);
    }
}