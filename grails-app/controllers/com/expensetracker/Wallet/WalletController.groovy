package com.expensetracker.Wallet

import com.expensetracker.Expense.Expense
import com.expensetracker.Learn.Learn
import com.expensetracker.Profile.Profile
import com.expensetracker.SpringSecurity.SecUser
import grails.plugin.springsecurity.annotation.Secured

import java.text.BreakIterator

class WalletController {


    def springSecurityService


    @Secured(['ROLE_USER'])
    def index() {}

    def learning(String purpose, Long amount) {

        List d = Learn.findAllWhere(meaning:'debit')
        List deduct = []

        d.each { abc ->
            deduct.add(abc.word)
        }

        List c = Learn.findAllWhere(meaning:'credit')
        List gain = []

        c.each { abc ->
            gain.add(abc.word)
        }

        List<String> words = new ArrayList<String>();
        BreakIterator breakIterator = BreakIterator.getWordInstance();
        breakIterator.setText(purpose);
        int lastIndex = breakIterator.first();
        while(BreakIterator.DONE != lastIndex) {
            int firstIndex = lastIndex;
            lastIndex = breakIterator.next();
            if (lastIndex != BreakIterator.DONE && Character.isLetterOrDigit(purpose.charAt(firstIndex))) {
                words.add(purpose.substring(firstIndex, lastIndex));
            }
        }

        println words.size()

        def learnInstance = Learn.list().word
        println learnInstance

        if(words.size()>1) {

            if(!learnInstance.contains(words.get(0))){
                redirect(controller:'wallet', action: 'learn')
                return
            } else {
                if(!Collections.disjoint(deduct, words)) {

                    def currentUserId = SecUser.get(springSecurityService.currentUser.id)
                    def currentDate = new Date()
                    println "here"
                    println "amount here:"+amount

                    Expense expenseInstance = new Expense([
                            transactionPurpose: purpose,
                            transactionAmount: amount,
                            author: currentUserId,
                            dateCreated: currentDate,
                            lastUpdated: currentDate,
                            transactionType: Expense.TransactionType.DEBIT
                    ])

                    Profile profileInstance = Profile.get(springSecurityService.currentUser.id)
                    profileInstance.walletAmount -= amount

                    println profileInstance.walletAmount

                    profileInstance.save()

                    if(learnInstance.contains(words.get(2))){
                        def search = Learn.findByWord(words.get(2))
                        Learn learnInstanceIncrement = Learn.get(search.id)
                        learnInstanceIncrement.count++
                        redirect(controller:'dashBoard',action:'index')
                        return
                    } else {
                        redirect(controller:'wallet', action:'learn')
                        return
                    }
                    println "reached outside"
                    expenseInstance.save()
                    println "saved 1"
                    redirect(controller: 'dashBoard',action:'index')
                } else if(!Collections.disjoint(gain, words)) {

                    def currentUserId = SecUser.get(springSecurityService.currentUser.id)
                    def currentDate = new Date()
                    println "here"
                    println "amount here:"+amount

                    Expense expenseInstance = new Expense([
                            transactionPurpose: purpose,
                            transactionAmount: amount,
                            author: currentUserId,
                            dateCreated: currentDate,
                            lastUpdated: currentDate,
                            transactionType: Expense.TransactionType.CREDIT
                    ])

                    Profile profileInstance = Profile.get(springSecurityService.currentUser.id)

                    println profileInstance.walletAmount
                    profileInstance.walletAmount = profileInstance.walletAmount + amount


                    profileInstance.save()
                    println "saved status: $profileInstance"
                    if(learnInstance.contains(words.get(2))){
                        def search = Learn.findByWord(words.get(2))
                        Learn learnInstanceIncrement = Learn.get(search.id)
                        learnInstanceIncrement.count++
                        redirect(controller:'dashBoard',action:'index')
                        return
                    } else {
                        redirect(controller:'wallet', action:'learn')
                        return
                    }
                    println "reached outside"
                    expenseInstance.save()
                    println "saved 2"
                    redirect(controller: 'dashBoard',action:'index')
                } else {
                    render "illegal statement."
                    return
                }
            }
        }


    }

    def savelearn(String newWord, String newMeaning) {

        println params
        def userId = SecUser.get(springSecurityService.currentUser.id)
        Learn learnInstance = new Learn(word: newWord, meaning: newMeaning, count: 1L, author: userId)
        learnInstance.save()
        println learnInstance.word
        println learnInstance.meaning
        println learnInstance.count
        println learnInstance.author
        redirect(controller:'wallet',action:'index')
    }

    def learn() {}
}
