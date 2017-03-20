package com.expensetracker.Reminder

import com.expensetracker.Expense.Expense
import com.expensetracker.TaskReminder.TaskReminder
import grails.plugin.springsecurity.annotation.Secured

class ReminderController {

    @Secured(['ROLE_USER'])
    def index() {
        [rem: TaskReminder.listOrderByLastUpdated(order:'desc')]
    }
}
