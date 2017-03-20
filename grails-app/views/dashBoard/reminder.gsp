<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="jumbotron">
                    <div class="container">
                        <g:form method="post" controller="dashBoard" action="savereminder">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                 <textarea class="mdl-textfield__input" type="text" id="task" name="task" rows="3"></textarea>
                                 <label class="mdl-textfield__label" for="task">Task...</label>
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