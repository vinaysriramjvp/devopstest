import { LightningElement, api, wire } from "lwc";
import { CurrentPageReference } from 'lightning/navigation';

export default class RecordContextAction extends LightningElement {
    @api recordId;
    @api objectApiName;

    @wire(CurrentPageReference)
    pageRef;

    get pageRefString() {
        return JSON.stringify(this.pageRef);
    }
    connectedCallback(){
        console.log('recordId'+this.recordId);
    }
}