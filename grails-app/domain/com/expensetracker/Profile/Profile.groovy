package com.expensetracker.Profile

import com.expensetracker.SpringSecurity.SecUser

class Profile {

    String fullName
    String userName
    Long contactNumber
    Gender gender
    Long walletAmount
    SecUser email

    static constraints = {
        fullName blank: false, nullable: false, matches: "[a-zA-z]+"
        userName blank: false, nullable: false, unique: true
        contactNumber matches: "[0-9]+", nullable: true
        walletAmount blank: false, nullable: false, matches: "[0-9]+",min:0l
        gender blank: false, nullable: false, inList: Gender.values() as List
        email unique: true
    }

    enum Gender {

        NOTSELECTED(0),MALE(1), FEMALE(2)
        final int id

        Gender(int id) {
            this.id = id
        }
    }
}
