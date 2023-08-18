import { LightningElement } from 'lwc';
import getRecipes from '@salesforce/apex/RecipesAPI.getRecipes';

const columns = [
    { label: 'credits Text', fieldName: 'creditsText' },
    { label: 'health Score', fieldName: 'healthScore' },
    { label: 'cooking Minutes', fieldName: 'cookingMinutes' }
];

export default class LWC_API extends LightningElement {

}