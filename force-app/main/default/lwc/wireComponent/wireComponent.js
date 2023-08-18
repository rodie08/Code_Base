import { LightningElement, wire, track } from 'lwc';
import wire_Method from '@salesforce/apex/Wire_Handler.wire_Method';
import { refreshApex } from '@salesforce/apex';


export default class WireComponent extends LightningElement {
    @track inputvalue;
    @track wiredData;
    @track sObjectList1 = [];
    recordList = [];

    @wire(wire_Method, { ojectName: '$inputvalue' })
    wiredmethod({ data, errro }) {
        if (data) {
            this.sObjectList1 = data.objectList;
            var recordListvar = [];
            for (var i = 0; i < data.length; i++) {
                var record = { Id: data[i].Id, Name: data[i].Name };
                console.log('record>>>>>>' + record);
                recordListvar.push(record);
            }
            //this.sObjectList1 = recordListvar;
        }
    }
    handleRefresh() {
        return refreshApex(this.sObjectList1);
    }
    handleInputChange(evt) {
        try {
            console.log('handleInputChange');
            this.inputvalue = evt.target.value;
            console.log('handleInputChange>>>' + this.inputvalue);
            //this.handleRefresh();
            console.log('sObjectList1>>>' + JSON.stringify(this.sObjectList1));
        } catch (error) {
            console.log('error>>>' + error);
        }

    }

}