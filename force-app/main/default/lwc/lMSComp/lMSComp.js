import { LightningElement, api, track, wire } from 'lwc';
import child from './child.html';
import parent from './lMSComp.html';
export default class LMSComp extends LightningElement {
    @api countvalue = 0;
    callChild = false;
    callParent = false;
    @api parentcounter = 0;
     @track valueFromChild='';

    connectedCallback() {
        //this.template.querySelector('c-child');
    }
    constructor() {
        super();
        console.log('Inside constructor');
    }
    connectedCallback() {
        console.log('Inside connected callback');
    }
    disconnectedCallback() {
        console.log('Inside disconnected callback');
    }

    InputHandler(evt) {
        console.log('InputHandler>>>' + evt.target.value);
        this.countvalue = parseInt(evt.target.value);
    }
    ClearHandler(evt) {
        console.log('ClearHandler>>>');
        this.countvalue = 0;
    }
    EmptyInputHandler(evt) {
        console.log('ClearHandler>>>');
        this.countvalue = '';
    }
    CounterHandler(evt) {
        console.log('CounterHandler>>>' + evt.target.Value);
        //this.countvalue = evt.target.Value;
    }
    CallChildMethodHandler(evt) {
        console.log('CallChildMethodHandler>>>');
        const updateValue = this.template.querySelector('c-child-child');
        updateValue.incrementChildCounter();

    }
    //----------------------------------------------------------------------------------------//

    CallChildHandler(evt) {
        console.log('CallChildHandler>>>');
        this.callChild = true;
        this.callParent = false;

        //this.countvalue = evt.target.Value;
    } render() {

        if (this.callChild) {
            console.log('render>>>' + this.callChild);
            return child;
        } else if (this.callParent) {
            console.log('render>>>' + this.callParent);
            return parent;
        } else {
            return parent;
        }

    } neew() {
        try {
            console.log('CallParentHandler>>>');
            this.callChild = false;
            this.callParent = true;
        } catch (error) {
            console.log('CallParentHandler>>>' + error);
        }
    }
    //----------------------------------------------------------------------------
    addHandler(evt) {
        console.log('addHandler>>>');
        this.parentcounter += 1;
    }
    substractHandler(evt) {
        console.log('substractHandler>>>');
        this.parentcounter -= 1;

    }
    clearCounterHandler() {
        console.log('clearCounterHandler>>>');
        this.parentcounter = 0;
    }
    showChild(evt){
        console.log('showChild>>>>');
        this.valueFromChild = evt.detail;
    }
}