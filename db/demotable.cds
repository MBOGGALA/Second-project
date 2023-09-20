namespace mohan.db;

context orders {
    entity bp {
      key ID : Int64;
      customername  : String(120);
      contactperson : String(64);
      grossamount   : Decimal(10,2);
      currency      : String(4);
    }
}
