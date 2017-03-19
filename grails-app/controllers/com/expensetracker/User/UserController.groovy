package com.expensetracker.User

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured


class UserController {

    @Secured(['permitAll'])
    def home() {

        if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            redirect (controller: 'dashBoard', action: 'index')
            return
        } else {
            render "invalid request"
        }
    }
}
