<g:applyLayout name="mainLayout">

<html>
    <head>
            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    </head>
    <body>
        <content tag="body">
            <g:if test="${resu}">
                <div class="row">
                    <h4 class="page-header" style="float:right">Hello, <b>${resu.fullName}</b>! Welcome to Expense Tracker.</h4>
                </div>
                <div class="row">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="jumbotron">
                                                <h4 class="page-header"> <b>Wallet</b> </h4>
                                                <hr>
                                                <p>Amount left in your wallet is:</p>
                                                <h1 class="text-center">${resu.walletAmount}<i class="fa fa-fw fa-inr"></i></h1><br>
                                                <g:link controller="wallet" action="index">
                                                <i class="fa fa-fw fa-3x fa-plus-circle pull-right"></i>
                                                </g:link>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                       <div class="col-sm-12">
                                            <div class="card">
                                                <g:if test="${data}">
                                                <div class="jumbotron">
                                                <h4 class="page-header"><b>Pie-Chart Analysis<b></h4>
                                                <hr>
                                                    <gvisualization:pieCoreChart elementId="piechart" title="My Daily Activities" width="${450}" height="${300}"
                                                     columns="${col}" data="${data}" />
                                                     <div id="piechart"></div>
                                                </div>
                                                </g:if>
                                            </div>
                                       </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="card">
                                    <div class="jumbotron">
                                        <h4 class="page-header"><b>Upcoming Task</b></h4>
                                        <hr>
                                        <g:if test="${task}">
                                        <g:each in="${task}">
                                            <div class="card">
                                                <ul class="demo-list-three mdl-list">
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
                                            <blockquote>
                                                <p>You have no upcoming events, or reminders.</p>
                                                <p>Wanna to add some?</p>
                                                <p>Just click on the + button given below.</p>
                                            </blockquote>
                                        </g:else>
                                        <g:link controller="dashBoard" action="reminder">
                                        <i class="fa fa-fw fa-3x fa-plus-circle pull-right"></i>
                                        </g:link>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="jumbotron">
                            <h4 class="page-header text-center"><b>Graphical Analysis<b></h4>
                               <hr>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="card">
                                        <gvisualization:columnCoreChart elementId="columnChart" title="bar chart" width="${450}" height="${500}"
                                            columns="${col}" data="${data}"/>
                                            <div id="columnChart"></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="card">
                                        <gvisualization:areaCoreChart elementId="areaChart" title="bar chart" width="${450}" height="${500}"
                                            columns="${col}" data="${data}"/>
                                            <div id="areaChart"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>
        </content>
    </body>
</html>

</g:applyLayout>