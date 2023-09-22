using { mohan.db.master,mohan.db.transaction,mohan.db.CDSVIEW,CV_PURCHASE} from '../db/datamodel';

service Catalogservice @( title:'Catalogservice' ) {
    entity Businesspartner as projection on master.businesspartner;
    entity Address as projection on master.address;
    entity Product as projection on master.product;
    entity Employees as projection on master.employees;

    entity purchaseorderH as projection on transaction.purchaseorder{
        *,
        Items: redirected to poitems
    }
    entity poitems @(title : '{i18n>poItems}') as projection on transaction.poitems{
        *,
        PARENT_KEY  : redirected to purchaseorderH,
        PRODUCT_GUID: redirected to Product
    }  
     entity POWorklist as projection on CDSVIEW.POWorklist;
     entity ProductOrders as projection on CDSVIEW.ProductViewSub;
     entity ProductAggreagation as projection on CDSVIEW.CProductValuesView excluding{
      ProductId
     };

entity Purchaseorders as projection on CV_PURCHASE;

}
