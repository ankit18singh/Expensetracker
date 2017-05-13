package com.expensetracker.Register

import com.expensetracker.Profile.Profile
import com.expensetracker.SpringSecurity.*
import grails.plugin.springsecurity.annotation.Secured

class RegisterController {

    def registerService
    def springSecurityService

    @Secured(['permitAll'])
    def index(String s_fullname, String s_password, String s_email) {

        println "hello"
        def checkEmail = SecUser.findByUsername(s_email)
        if(checkEmail) {
            flash.signupError = "This Email-Id is already Registered!"
            redirect (controller: 'login', action: 'auth')
        } else {

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
                    email         : currentuser.id,
                    contactNumber : 9999999999
            ])
            println "firtsname:"+newUserInstance.fullName
            println "usename:"+newUserInstance.userName
            println "email:"+newUserInstance.email
            println "gender:"+newUserInstance.gender
            println "wallet:"+newUserInstance.walletAmount
            println "number:"+newUserInstance.contactNumber
            newUserInstance.save()
            println "data is: $newUserInstance"

            springSecurityService.reauthenticate(s_email)
            redirect(controller:'dashBoard', action:'index')
        }
    }
}
