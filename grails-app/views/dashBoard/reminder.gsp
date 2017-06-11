<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="jumbotron">
                    <div class="container">
                    <h2 class="page-header"><b>Add a Reminder</b> </h2>
                    <hr>
                        <div class="row">
                            <div class="col-sm-6">
                                <g:form method="post" controller="dashBoard" action="savereminder">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                         <textarea class="mdl-textfield__input" type="text" id="task" name="task" rows="3"></textarea>
                                         <label class="mdl-textfield__label" for="task">Task...</label>
                                    </div>
                                    <br>
                                    <g:submitButton name="save" value="save" class="btn btn-default"/>
                                </g:form>
                            </div>
                            <div class="col-sm-6">
                            <p> To add a reminder of an upcoming event or task,
                                                 Enter your message in the text box below and then
                                                  click on save button to attach a new note to your profile. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </content>
        </body>
    </html>
</g:applyLayout>