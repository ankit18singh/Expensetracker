package com.expensetracker.Register

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

            def registerInstance = registerService.RegisterInstanceModel(s_fullname,s_email,s_password)
            springSecurityService.reauthenticate(s_email)
            redirect(controller:'dashBoard', action:'index')
        }
    }
}
