import { api, LightningElement,wire } from 'lwc';
import getnextRecord from '@salesforce/apex/CustomButtonsController.getNextRecord';
import getobjName from '@salesforce/apex/CustomButtonsController.getObjectName';
import { NavigationMixin } from 'lightning/navigation';
import { CloseActionScreenEvent } from 'lightning/actions';
import { CurrentPageReference } from 'lightning/navigation';
export default class CustomNextButton extends NavigationMixin(LightningElement) {
@api recordId;
@api nextRecordId;
@api tonav;
@api objectName;
@api objectApiName;
@wire(CurrentPageReference)
pageRef;
connectedCallback(){
    console.log('recordId' +this.recordId);
    //this.recordId ='a0H6F00000N2VEdUAN';
    console.log('recordId' +this.recordid);
    getobjName({recordId :'$recordId'})
    .then(result => {
        this.objectName =result;
        //console.log('nextRecordId'+this.nextRecordId);
    });
    getnextRecord({recordId :'$recordId'})
    .then(data => {
        this.nextRecordId =data;
        console.log('nextRecordId'+this.nextRecordId);
        if(!this.nextRecordId){
            console.log(' if nextRecordId'+this.nextRecordId);
            this.navigateToNextRecordPage();
            console.log('after navigation');
           // window.open('/'+this.nextRecordId,'_self');
            this.dispatchEvent(new CloseActionScreenEvent());
        }

    });
    if(this.tonav == true){
        console.log('nextRecordId'+this.nextRecordId);
        this.navigateToNextRecordPage();
        console.log('after navigation');
       // window.open('/'+this.nextRecordId,'_self');
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}
navigateToNextRecordPage() {
    console.log('Nav nextRecordId'+this.nextRecordId);
    this[NavigationMixin.Navigate]({
        type: 'standard__objectPage',
        attributes: {
            recordId: this.nextRecordId,
            objectApiName: this.objectName,
            actionName: 'view'
        }
    });
}

}