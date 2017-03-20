package com.expensetracker.DashBoard

import com.expensetracker.Learn.Learn
import com.expensetracker.Profile.Profile
import com.expensetracker.SpringSecurity.SecUser
import com.expensetracker.TaskReminder.TaskReminder
import grails.converters.JSON
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

    def chart() {}
    def googlechart() {

/*        def myDailyActivitiesColumns = [['string', 'Task'], ['number', 'Hours per Day']]
        def myDailyActivitiesData = [['Work', 11], ['Eat', 2], ['Commute', 2], ['Watch TV', 2], ['Sleep', 7]]

        [col:myDailyActivitiesColumns,data:myDailyActivitiesData]*/

        def col = Learn.createCriteria().list(){
            ne("meaning","debit")
            ne("meaning","credit")
        }
        def datas = []
        def column = [['string','Entity'],['number','Occurance']]



        col.each { abc ->

            datas << [abc.word,abc.count]
        }
        [data: datas,col:column]
    }

    def data_1() {
        render([status_temp: 25, status_pending: 25, status_partial: 25, status_complete: 25] as JSON)
    }
}
