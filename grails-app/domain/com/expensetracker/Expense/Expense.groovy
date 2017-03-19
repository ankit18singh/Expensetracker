package com.expensetracker.Expense

import com.expensetracker.SpringSecurity.SecUser

class Expense {

    Long transactionAmount
    String transactionPurpose
    Date dateCreated
    Date lastUpdated
    SecUser author
    TransactionType transactionType

    static constraints = {
        transactionAmount min: 0l, matches:"[0-9]+",blank:false
        transactionPurpose blank: false, nullable:false
    }

    enum TransactionType{
        DEBIT(1),CREDIT(2)
        final int id

        TransactionType(int id) {
            this.id = id
        }
    }
}
