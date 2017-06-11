<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="jumbotron">
                    <div class="container">
                    <h2 class="page-header"><b>Wallet </b></h2><hr>
                        <div class="row">
                            <div class="col-sm-6">
                                <g:form controller="wallet" action="learning" method="post">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="amount" name="amount">
                                        <label class="mdl-textfield__label" for="amount">Amount...</label>
                                     </div>
                                     <br>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                         <textarea class="mdl-textfield__input" type="text" id="purpose" name="purpose" rows="3"></textarea>
                                         <label class="mdl-textfield__label" for="purpose">Reason...</label>
                                    </div>
                                    <br>
                                    <g:submitButton name="save" value="save" class="btn btn-default"/>
                                </g:form>
                            </div>
                            <div class="col-sm-6">
                            <h5>Following rules should be strictly followed:</h5>
                                                <ul>
                                                    <li>Amount should be entered in Numeric value.</li>
                                                    <li>No need to add the currency symbol after the value.</li>
                                                    <li>The transcation objective should follow the grammatical standards provided by the application.</li>
                                                    <li>The objective should be written in the following format:
                                                            <ul>
                                                                <li><code>"verb", "quantity/article", "noun".</code></li>
                                                                <li>Example:-  'bought a mango.', 'purchased an apple', 'credited by bank'</li>
                                                                <li>No need to write inside quotes.</li>
                                                            </ul>
                                                        </li>
                                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </content>
        </body>
    </html>
</g:applyLayout>