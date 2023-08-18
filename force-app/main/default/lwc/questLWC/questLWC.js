import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import defaultContact from '@salesforce/apex/AccountDefaultContact.defaultContact';

export default class QuestLWC extends LightningElement {
    value = 'No';
    get options() {
        return [
            { label: 'Yes', value: 'Yes' },
            { label: 'No', value: 'No' },
        ];
    }
    @track namevalue = '';
    @track Phone = '';
    @track email = '';
    @track active = '';
    @track Account_Activation_Summary = '';

    btnhandleClick(event) {
        console.log('Name: '+this.namevalue );
        console.log('Phone : '+this.Phone );
        console.log('email : '+this.email );
        console.log('active '+this.active );
        console.log('activation '+this.Account_Activation_Summary );

        defaultContact({

        })
        .then( result=>{

        }).catch( errro =>{

        });
    }
    accNameHandleChange(evt) {
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(evt.target.value));
        this.namevalue = evt.target.value;
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(this.namevalue));
    }
    phoneNameHandleChange(evt) {
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(evt.target.value));
        this.Phone = evt.target.value;
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(this.Phone));
    }
    emailNameHandleChange(evt) {
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(evt.target.value));
        this.email = evt.target.value;
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(this.email));
    }
    handleChange(evt) {
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(evt.target.value));
        this.active = evt.target.value;
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(this.active));
    }
    SummaryHandleChange(evt) {
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(evt.target.value));
        this.Account_Activation_Summary = evt.target.value;
        console.log('accNameHandleChange is running from QuestLWC : ' + JSON.stringify(this.Account_Activation_Summary));
    }

    showInfoToast(title, message, variantmode) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(evt);
    }
}