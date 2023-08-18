import { LightningElement, track, api, wire } from 'lwc';
import getAccount from '@salesforce/apex/TextLWC.getAccount';
import createContact from '@salesforce/apex/TextLWC.createContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getContactList from '@salesforce/apex/TextLWC.getContactList';

export default class TestLWC extends LightningElement {

    emailvalue = "username@example.com";
    username = "username";
    checkBoxFieldValue = false;
    accounts = [];
    accounts1 = [];
    @track value = 'ew ass';
    data = [];
    columns = [];
    selectedRows = [];
    items = [];
    recordCount = 20;
    loadMoreStatus;
    totalRecountCount = 0;
    targetDatatable;
    contacts;
    error;
    connectedCallback() {
        //  this.value = '0015j00000dGVI3AAO';
        this.handleLoad();
    }
    // MAIN body

    columns = [
        { label: 'Name', fieldName: 'name' },
        { label: 'Id', fieldName: 'Id' },
    ];
    handleMobileChange(event) {
        this.username = event.target.value;
        console.log(this.mobilevalue);
    }
    handleCheckBoxChange(event) {
        this.checkBoxFieldValue = event.target.checked;
        console.log(this.checkBoxFieldValue);
    }

    @wire(getAccount,{'objectName': 'Account'})
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data.map(account => ({ label: account.Name, value: account.Id }));
        } else if (error) {
            console.error(error);
        }
    }
    handleComboBox1(event) {
        try { console.error('handleComboBox' + event.detail.value); } catch (error) {
            console.error('error' + error);
        }


        this.value = event.detail.value;
        //console.error(this.value);
    }

    handleClick() {
        console.log('handleClick called');
        console.log('handleClick called' + this.username);
        console.log('handleClick called' + this.value);
        createContact({ username: this.username, value: this.value })
            .then(result => {
                console.log('Data:' + JSON.stringify(result));
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Record created successfully',
                        variant: 'success',
                    }),
                );
            }).catch(error => {
                console.log(error);
            });

    }
    // table
    getSelectedName(event) {
        console.log('error');
        const selectedRows = event.detail.selectedRows;
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++) {
            alert('You selected: ' + selectedRows[i].Id);
        }
    }
    handleLoadMore(event) {
        console.log('handleLoadMore>>>>');
        event.preventDefault();
        // increase the record Count by 20 on every loadmore event
        this.recordCount = this.recordCount + 20;
        //Display a spinner to signal that data is being loaded
        event.target.isLoading = true;
        //Set the onloadmore event taraget to make it visible to imperative call response to apex.
        this.targetDatatable = event.target;
        //Display "Loading" when more data is being loaded
        this.loadMoreStatus = 'Loading';
        // Get new set of records and append to this.data
        this.getRecords();
    }
    // search bar
    handleLoad() {
        console.log('handleLoad>>>>>>>>>>>.');
        getContactList()
            .then(result => {
                console.log('103>>>>> ' + JSON.stringify(result))
                //this.contacts = result.map(contact => ({ name: contact.Name, Id: contact.Id }));
                let contactList = [];
                for (let i = 0; i < result.length; i++) {
                    let contactInstance = {
                        name: result[i].Name,
                        Id: result[i].Id
                    };
                    contactList.push(contactInstance);
                    // this.contacts = result.map(contact => ({ name: result[i].Name, Id: result[i].Id }));
                }
                this.contacts = contactList;
                console.log('107>>>>> ' + JSON.stringify(this.contacts));
                //this.contacts = result;
            })
            .catch(error => {
                this.error = error;
            });
    }
    getRecords() {
        this.recordCount = (this.recordCount > this.totalRecountCount) ? this.totalRecountCount : this.recordCount;
        //this.accounts = this.items.slice(0, this.recordCount);
        this.loadMoreStatus = '';
        if (this.targetDatatable) {
            this.targetDatatable.isLoading = false;
        }
    }

}