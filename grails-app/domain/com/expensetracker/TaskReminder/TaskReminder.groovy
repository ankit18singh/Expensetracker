package com.expensetracker.TaskReminder

import com.expensetracker.SpringSecurity.SecUser

class TaskReminder {

    SecUser creatorName
    String taskNote
    Date dateCreated
    Date lastUpdated
    Priority setPriority

    static constraints = {
        taskNote blank: false, nullable: false
        setPriority blank: false, nullable: false, inList: Priority.values() as List
        creatorName blank: false, nullable: false
    }

    enum Priority {
        LOW(1), HIGH(2)
        final int id

        Priority(int id) {
            this.id = id
        }
    }
}
