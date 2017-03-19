package com.expensetracker.Wallet
import grails.plugin.springsecurity.annotation.Secured

import java.text.BreakIterator

class WalletController {

    @Secured(['ROLE_USER'])
    def index() {}

    def learning(String purpose) {

        List<String> deduct = ["bought","purchased","buy","paid"]
        List<String> add = ["got","added","credited","gain", "gained"]

        println purpose
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

        println words

        if(!Collections.disjoint(deduct, words)) {
            render "result is a case of deduction"
        } else if(!Collections.disjoint(add, words)) {
            render "result is a case of addition"
        } else {
            render "illegal statement."
        }
    }
}
