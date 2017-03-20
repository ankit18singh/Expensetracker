<g:applyLayout name="settingsLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
            <h2 class="page-header">Update Profile</h2>
               <g:form controller="settings" action="saveUpdated">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                   <input class="mdl-textfield__input" type="text" name="fullname" id="fullname" value="${edited.fullName}">
                   <label class="mdl-textfield__label" for="fullname">Full Name...</label>
                 </div>
                 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                     <input class="mdl-textfield__input" type="text" id="username" name="username" value="${edited.userName}">
                     <label class="mdl-textfield__label" for="username">Username...</label>
                   </div>
                   <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                       <input class="mdl-textfield__input" type="text" id="contact" name="contact" value="${edited.contactNumber}">
                       <label class="mdl-textfield__label" for="contact">Contact Number...</label>
                     </div>
                       <select class="form-control" name="gender" id="gender" required="required"><br>
                           <option disabled selected value="">--Select a status--</option>
                           <option value="Male">Male</option>
                           <option value="Female">Female</option>
                       </select><br>
                       <g:submitButton name="save" value="save" class="btn btn-default"/>
                   </g:form>
            </content>
        </body>
    </html>
</g:applyLayout>