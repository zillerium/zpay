pragma solidity ^0.4.19;

contract CINV {

    // invoice hash
    struct Invoice {
       bool InvoiceRec; 
    }
 
    // ledger of all invoices
    mapping (bytes32=>Invoice) public Invoices;

    // add invoice
    function addInvoice(bytes32 _invoice) public {
        Invoices[_invoice].InvoiceRec=true;
    }
  
    // check if exists  
    function InvoiceExists (bytes32 _invoice) view public returns (bool) {
        if (Invoices[_invoice].InvoiceRec) return true;
        else return false;
    }
}

contract CPO {

     struct PO {
       bool PORec; 
    }
 
    // ledger of all Purchase Orders
    mapping (bytes32=>PO) public POs;

    // add PO
    function addPO(bytes32 _po) public {
        POs[_po].PORec=true;
    }
  
    // check if exists  
    function POExists (bytes32 _po) view public returns (bool) {
        if (POs[_po].PORec) return true;
        else return false;
    }

}

contract CLedger {

    struct Payment {
        bool paymentRec;
    }
    
    mapping (bytes32 => mapping (bytes32 => Payment)) public payments;
    
 
    
    function addPayment(bytes32 _invoice, bytes32 _po) public {
          payments[_invoice][_po].paymentRec=true;
    }

    function PaymentExists (bytes32 _invoice, bytes32 _po) view public returns (bool) {
        if (payments[_invoice][_po].paymentRec) return true;
        else return false;
        
    }

}

