package com.expensetracker.Register

import com.expensetracker.Profile.Profile
import grails.transaction.Transactional
import com.expensetracker.SpringSecurity.*


@Transactional
class RegisterService {

    def RegisterInstanceModel(s_fullname,s_email, s_password) {

        println "Params receieved are: \n fullname: $s_fullname, \n email: ${s_email} \n password: ${s_password}"
        def newuserRole = SecRole.findByAuthority('ROLE_USER')?: new SecRole(authority : 'ROLE_USER').save()
        def newUser = new SecUser(username: "${s_email}", password: "${s_password}").save(flush:true)
        println "this is the username--> $newUser.username"
        println "this is the password--> $newUser.password"
        SecUserSecRole.create(newUser, newuserRole ,true)

        def currentuser = SecUser.findByUsername(s_email);
        println currentuser
        def currentuserid = currentuser.id;
        println currentuserid

        Profile newUserInstance =  new Profile([
                fullName      : "${s_fullname}",
                userName      : "${s_fullname}",
                gender        : Profile.Gender.NOTSELECTED,
                walletAmount  : 0L,
                email         : currentuser.id
        ])
        println "firtsname:"+newUserInstance.fullName
        println "usename:"+newUserInstance.userName
        println "emiail:"+newUserInstance.email
        println "gender:"+newUserInstance.gender
        println "wallet:"+newUserInstance.walletAmount
        newUserInstance.save()
        println "data is: $newUserInstance"
    }
}
