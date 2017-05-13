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
        fullName blank: false, nullable: false, matches: "[a-zA-z\\s]+"
        userName blank: false, nullable: false, unique: true
        contactNumber matches: "[0-9]+", nullable: false
        walletAmount blank: false, nullable: false, matches: "[0-9]+"
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
