<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="row">
                    <div class="col-sm-12">
                       <div class="jumbotron">
                       <h2 class="page-header"><b>Reminders<b></h2>
                       <hr>
                       <ul class="demo-list-three mdl-list">
                       <g:if test="${rem}">
                            <g:each in="${rem}">
                                <div class="card">
                                    <li class="mdl-list__item mdl-list__item--three-line">
                                      <span class="mdl-list__item-primary-content">
                                          <i class="material-icons mdl-list__item-avatar">person</i>
                                      <span>${it.taskNote}</span>
                                      <span class="mdl-list__item-text-body">
                                           ${it.lastUpdated}
                                     </span>
                                     </span>
                                    </li>
                               </div>
                            </g:each>
                       </g:if>
                            <g:else>
                            <div class="text-center">
                                <p> This page maintains a log of your Reminders Notes and Upcoming tasks</p>
                                <p> But it looks like you haven't performed any activity till now. </p>
                                <p> Want to try?</p>
                                <p> Click on the + button given below to add a note.</p></div>

                                        <g:link controller="dashBoard" action="reminder">
                                        <i class="fa fa-fw fa-3x fa-plus-circle pull-right"></i>
                                        </g:link>
                            </g:else>

                       </div>
                    </div>
                </div>
            </content>
        </body>
    </html>
</g:applyLayout>