import { LightningElement, api, track, wire } from 'lwc';
export default class ChildChild extends LightningElement {
    @api childcounter = 0;

    @api incrementChildCounter(evt) {
        console.log('incrementChildCounter>>>>>');
        this.childcounter += 10;
    }
    add(evt) {
        console.log('add>>>>>');
        this.dispatchEvent(new CustomEvent('add'));
        //this.childcounter += 1;
    }
    substract(evt) {
        console.log('substract>>>>>');
        this.dispatchEvent(new CustomEvent('substract'));
        // this.childcounter -= 1;
    }
    clear(evt) {
        console.log('substract>>>>>');
        this.dispatchEvent(new CustomEvent('clear'));
    }
    sendValueToParent() {
         console.log('sendValueToParent>>>>>');
        this.dispatchEvent(new CustomEvent('childvalue', { detail: 'Value form child', }));
    }

}