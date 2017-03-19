package com.expensetracker.Learn

import com.expensetracker.SpringSecurity.SecUser

class Learn {

    String word
    String meaning
    Long count
    SecUser author

    static constraints = {
        word blank: false, nullable: false
        meaning blank: false, nullable: false
        count min: 1L
    }
}
