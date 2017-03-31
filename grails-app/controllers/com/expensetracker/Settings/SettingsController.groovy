package com.expensetracker.Settings

import com.expensetracker.Profile.Profile
import com.expensetracker.SpringSecurity.SecUser
import grails.plugin.springsecurity.annotation.Secured

import com.expensetracker.Learn.Learn

class SettingsController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index() { }

    def savelearn(String newWord, String newMeaning) {

        println params
        def userId = SecUser.get(springSecurityService.currentUser.id)
        def search = Learn.findByWord(newWord)

        if(search){
            Learn learnInstance = Learn.get(search.id)
            learnInstance.count++
            redirect(action: 'learn')
        } else {
            Learn learnInstance = new Learn(word: newWord, meaning: newMeaning, count: 0L, author: userId)
            learnInstance.save()
            redirect(action:'learn')

        }
    }

    def learn() {}

    def password() {}

    def changePassword(String current_password, String new_password, String confirm_password) {

        println params
        SecUser activeUser = springSecurityService.currentUser
        def password_old = current_password
        if(!springSecurityService.passwordEncoder.isPasswordValid(activeUser.getPassword(), password_old, null)) {
            render "incorrect"

        }else {
            SecUser changePassword = SecUser.get(springSecurityService.currentUser.id)
            changePassword.password = new_password
            render "password changed successfully"
        }
    }

    def profile() {

        def currentUser = SecUser.get(springSecurityService.currentUser.id)
        Profile viewProfileInstance = Profile.findByEmail(currentUser)
        println viewProfileInstance
        render(view: 'profile', model:[profileDetails: viewProfileInstance])
    }

    def saveUpdated(String fullname, String username, String gender, Long contact) {

        def genderStatus
        def params
        Profile profileInstance = Profile.findByEmail(SecUser.get(springSecurityService.currentUser.id))
        profileInstance.userName = username
        profileInstance.contactNumber = contact
        profileInstance.fullName = fullname

        if(gender == 'Male') {
            genderStatus = Profile.Gender.MALE
        } else {
            genderStatus = Profile.Gender.FEMALE
        }

        profileInstance.gender = genderStatus

        profileInstance.save()
        redirect(controller:'settings', action: 'profile')
    }

    def updateProfile() {

        [edited: Profile.findByEmail(SecUser.get(springSecurityService.currentUser.id))]
    }
}
