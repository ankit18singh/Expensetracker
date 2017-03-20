<g:applyLayout name="settingsLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
            <h2 class="page-header">Change Password</h2>
                <g:form controller="settings" action="changePassword" method="post">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="current_password" name="current_password">
                    <label class="mdl-textfield__label" for="current_password">Currrent Password...</label>
                  </div>
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                     <input class="mdl-textfield__input" type="password" id="new_password">
                     <label class="mdl-textfield__label" for="new_password">New Password...</label>
                  </div>
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="password" id="confirm_password">
                    <label class="mdl-textfield__label" for="confirm_password">Confirm Password...</label>
                  </div>
                    <g:submitButton name="save" value="save" class=" btn btn-default"/>
                </g:form>
            </content>
        </body>
    </html>
</g:applyLayout>