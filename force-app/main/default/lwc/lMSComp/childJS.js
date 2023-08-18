import { LightningElement, api, track, wire } from 'lwc';
import child from './child.html';
import parent from './lMSComp.html';
export default class LMSComp extends LightningElement {

    @api childCounter;
    callParent = false;
    connectedCallback() {
        console.log('CounterHandler child comp JS >>>');
    }
    countvalue = {};
    /*CounterHandler(evt) {
        console.log('CounterHandler>>>'+evt.target.Value);
        this.countvalue = evt.target.Value;
    }*/
    render() {
        console.log('render>>>');
        if (this.callParent) {
            return parent;
        } else {
            return child;
        }
    }
    neew() {
        try {
            console.log('CallParentHandler>>>');
            this.callParent = true
        } catch (error) {
            console.log('CallParentHandler>>>' + error);
        }
    }
}