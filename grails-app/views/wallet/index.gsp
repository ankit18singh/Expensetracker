<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="jumbotron">
                    <div class="container">
                    <h2 class="page-header">Wallet</h2>
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
                </div>
            </content>
        </body>
    </html>
</g:applyLayout>