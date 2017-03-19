package com.expensetracker.DashBoard

import com.expensetracker.Profile.Profile
import com.expensetracker.SpringSecurity.SecUser
import com.expensetracker.TaskReminder.TaskReminder
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

class DashBoardController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index() {
        if(isLoggedIn()){
            def id =SecUser.get(springSecurityService.currentUser.id)
            def userprofile = Profile.findByEmail(id)
            render(view: 'index',model:[resu:userprofile])
        }
    }

    def reminder() {}

    def savereminder(String task) {
        println "here"
        def userId = SecUser.get(springSecurityService.currentUser.id)
        def currentDate = new Date()

        println "note:"+task
        println params
        TaskReminder taskInstance = new TaskReminder([
                creatorName: userId,
                taskNote:task,
                dateCreated: currentDate,
                lastUpdated: currentDate,
                setPriority: TaskReminder.Priority.LOW
        ])
        taskInstance.save()
        redirect(action: 'index')

    }
}
