package com.expensetracker.Timeline

import com.expensetracker.Expense.Expense
import grails.plugin.springsecurity.annotation.Secured

class TimelineController {

    @Secured(['ROLE_USER'])
    def index() {

        [tl: Expense.listOrderBylastUpdated(order: 'desc')]
    }
}
