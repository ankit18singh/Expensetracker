<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="row">
                    <div class="col-sm-12">
                       <div class="jumbotron">
                       <h2 class="page-header">Reminders</h2>
                       <ul class="demo-list-three mdl-list">
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
                       </div>
                    </div>
                </div>
            </content>
        </body>
    </html>
</g:applyLayout>