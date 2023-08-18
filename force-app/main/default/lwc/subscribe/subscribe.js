import { LightningElement, wire, api } from 'lwc';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import testLms from '@salesforce/messageChannel/Test_LMS__c';
export default class Subscribe extends LightningElement {

    countervalue = 0;
    subscribtion = null;
    @wire(MessageContext)
    messageContext;

    /*connectedCallback() {
        console.log('connectedCallback>>>');
        this.subscribeToMessageChannel();
    }
    subscribeToMessageChannel() {
        console.log('subscribeToMessageChannel>>>');
        this.subscribtion = subscribe(this.messageContext, testLms, (message) => this.operationHandler(message));
    }

    operationHandler(message) {
        console.log('operationHandler>>>');
        if (message.operator == 'Add') {
            this.countervalue += 1;
        } else if (message.operator == 'substract') {
            this.countervalue -= 1;
        }
    }*/
}