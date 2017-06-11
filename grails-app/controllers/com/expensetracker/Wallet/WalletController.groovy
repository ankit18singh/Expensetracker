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

        // println "param amount:" +amount
        //println "param purpose:" +purpose

        //list all the meanings
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

        //split word
        println "~~~~~~~~~~Split words~~~~~~~~~~~~~`"
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

        //if sentence is in proper format
        println "~~~~~~~~~~proper format~~~~~~~~~~~~~`"
        if(words.size()>1) {

            if(!learnInstance.contains(words.get(0))){
                redirect(controller:'wallet', action: 'learn')
                return
            } else {
                //search the order word in database
                println "~~~~~~~~~~Search word~~~~~~~~~~~~~`"
                if(!Collections.disjoint(deduct, words)) {

                    def currentUserId = SecUser.get(springSecurityService.currentUser.id)
                    def currentDate = new Date()
                    println "here"
                    println "currentUserId: "+currentUserId
                    println "amount here:"+amount

                    Expense expenseInstance = new Expense([
                            transactionPurpose: purpose,
                            transactionAmount: amount,
                            author: currentUserId,
                            dateCreated: currentDate,
                            lastUpdated: currentDate,
                            transactionType: Expense.TransactionType.DEBIT
                    ])

                    println "expenseInstance"+expenseInstance
                    println "expenseInstance"+expenseInstance.transactionPurpose
                    println "expenseInstance"+expenseInstance.transactionAmount
                    println "expenseInstance"+expenseInstance.author
                    println "expenseInstance"+expenseInstance.dateCreated
                    println "expenseInstance"+expenseInstance.lastUpdated
                    println "expenseInstance"+expenseInstance.transactionType

                    Profile profileInstance = Profile.findByEmail(springSecurityService.currentUser)

                    //profileInstance.save()

                    //if obj word is already available in table
                    println "~~~~~~~~~~word available~~~~~~~~~~~~~`"
                    if(learnInstance.contains(words.get(2))){
                        def search = Learn.findByWord(words.get(2))
                        Learn learnInstanceIncrement = Learn.get(search.id)
                        println "count before: "+learnInstanceIncrement.count
                        if(learnInstanceIncrement.count == 1) {
                            learnInstanceIncrement.count--
                        }
                        learnInstanceIncrement.count++
                        println "count after: "+learnInstanceIncrement.count

                        //save to timeline
                        println "~~~~~~~~~~saved to timeline~~~~~~~~~~~~~`"
                        expenseInstance.save()

                        //save to profile
                        println "~~~~~~~~~~Saved to profile~~~~~~~~~~~~~`"
                        profileInstance.walletAmount -= amount
                        profileInstance.save()
                        redirect(controller:'dashBoard',action:'index')
                        return
                    } else if(!learnInstance.contains(words.get(2))){ //if not available
                        println "~~~~~~~~~~Word not available~~~~~~~~~~~~~`"
                        def newword = words.get(2)
                        //open learn action
                        println "~~~~~~~~~~opening learn action~~~~~~~~~~~~~`"
                        render(view:'learn', model:[word: newword])
                        return
                    }
                    println "~~~~~~~~~~~~~reached outside~~~~~~~~~~~~"
                    redirect(controller: 'dashBoard',action:'index')
                } else if(!Collections.disjoint(gain, words)) {

                    def currentUserId = SecUser.get(springSecurityService.currentUser.id)
                    def currentDate = new Date()
                    println "here"
                    println "currentUserId: "+currentUserId
                    println "amount here:"+amount

                    Expense expenseInstance = new Expense([
                            transactionPurpose: purpose,
                            transactionAmount: amount,
                            author: currentUserId,
                            dateCreated: currentDate,
                            lastUpdated: currentDate,
                            transactionType: Expense.TransactionType.DEBIT
                    ])

                    println "expenseInstance"+expenseInstance
                    println "expenseInstance"+expenseInstance.transactionPurpose
                    println "expenseInstance"+expenseInstance.transactionAmount
                    println "expenseInstance"+expenseInstance.author
                    println "expenseInstance"+expenseInstance.dateCreated
                    println "expenseInstance"+expenseInstance.lastUpdated
                    println "expenseInstance"+expenseInstance.transactionType

                    Profile profileInstance = Profile.findByEmail(springSecurityService.currentUser)

                    //profileInstance.save()

                    //if obj word is already available in table
                    println "~~~~~~~~~~word available~~~~~~~~~~~~~`"
                    if(learnInstance.contains(words.get(2))){
                        def search = Learn.findByWord(words.get(2))
                        Learn learnInstanceIncrement = Learn.get(search.id)
                        learnInstanceIncrement.count++

                        //save to timeline
                        println "~~~~~~~~~~saved to timeline~~~~~~~~~~~~~`"
                        expenseInstance.save()

                        //save to profile
                        println "~~~~~~~~~~Saved to profile~~~~~~~~~~~~~`"
                        profileInstance.walletAmount += amount
                        profileInstance.save()
                        redirect(controller:'dashBoard',action:'index')
                        return
                    } else if(!learnInstance.contains(words.get(2))){ //if not available
                        println "~~~~~~~~~~Word not available~~~~~~~~~~~~~`"
                        def newword = words.get(2)
                        //open learn action
                        println "~~~~~~~~~~opening learn action~~~~~~~~~~~~~`"
                        render(view:'learn', model:[word: newword])
                        return
                    }
                    println "~~~~~~~~~~~~~reached outside~~~~~~~~~~~~"
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