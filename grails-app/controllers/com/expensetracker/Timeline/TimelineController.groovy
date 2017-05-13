package com.expensetracker.Timeline

import com.expensetracker.Expense.Expense
import com.expensetracker.SpringSecurity.SecUser
import grails.plugin.springsecurity.annotation.Secured

class TimelineController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index() {

        def currentUser = SecUser.get(springSecurityService.currentUser.id)
        println currentUser.id
        println "here"+currentUser.id.getClass().getName()

        def cId = currentUser.id
        println "this id:"+cId
        println 'type'+cId.getClass().getName()

        def tlist = Expense.findAllByAuthor(SecUser.get(springSecurityService.currentUser.id),[sort: 'lastUpdated',order:'desc', max:10])
        render(view: 'index', model:[tl: tlist])

        //[tl: Expense.listOrderBylastUpdated(order: 'desc
    }
}
