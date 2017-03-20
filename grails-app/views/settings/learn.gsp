<g:applyLayout name="settingsLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <h2 class="page-header">Learn</h2>
                <g:form controller="settings" action="savelearn" method="post">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="newWord" name="newWord">
                        <label class="mdl-textfield__label" for="newWord">Word...</label>
                      </div>
                     <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                         <input class="mdl-textfield__input" type="text" id="newMeaning" name="newMeaning">
                         <label class="mdl-textfield__label" for="newMeaning">Meaning...</label>
                       </div>
                    <br>
                    <g:submitButton name="save" value="save" class="btn btn-default"/>
                </g:form>
            </content>
        </body>
    </html>
</g:applyLayout>