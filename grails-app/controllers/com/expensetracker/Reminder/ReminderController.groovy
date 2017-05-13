package com.expensetracker.Reminder

import com.expensetracker.SpringSecurity.SecUser
import com.expensetracker.TaskReminder.TaskReminder
import grails.plugin.springsecurity.annotation.Secured

class ReminderController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index() {
        def currentUser = SecUser.get(springSecurityService.currentUser.id)
        println currentUser.id
        println "here"+currentUser.id.getClass().getName()

        def cId = currentUser.id
        println "this id:"+cId
        println 'type'+cId.getClass().getName()

        def tlist = TaskReminder.findAllByCreatorName(SecUser.get(springSecurityService.currentUser.id),[sort: 'lastUpdated',order:'desc', max:10])
        render(view: 'index', model:[rem: tlist])


        //[rem: TaskReminder.listOrderByLastUpdated(order:'desc')]
    }
}
