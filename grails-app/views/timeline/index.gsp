<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="row">
                    <div class="col-sm-12">
                       <div class="jumbotron">
                        <h2 class="page-header"><b>Timeline</b></h2>
                        <hr>
                            <g:if test="${tl}">
                                <g:each in="${tl}">
                                        <div class="qa-message-list" id="wallmessages">
                                            <div class="message-item" id="m16">
                                                <div class="message-inner">
                                                    <div class="message-head clearfix">
                                                        <div class="avatar pull-left">
                                                            <a href="./index.php?qa=user&qa_1=Oleg+Kolesnichenko">
                                                                <img src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                                            </a>
                                                        </div>
                                                        <div class="user-detail">
                                                            <h5 class="handle">${it.author.username}</h5>
                                                            <div class="post-meta">
                                                                <div class="asker-meta">
                                                                    <span class="qa-message-what"></span>
                                                                    <span class="qa-message-when">
                                                                        <span class="qa-message-when-data">${it.lastUpdated}</span>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="qa-message-content">
                                                        <h6>${it.transactionPurpose}
                                                        <span class="mdl-chip pull-right">
                                                            <span class="mdl-chip__text">${it.transactionAmount}<i class="fa fa-fw fa-inr"></i></span>
                                                        </span></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </g:each>
                            </g:if>
                            <g:else>
                            <div class="text-center">
                                <p> This page maintains a log of your transaction.</p>
                                <p> But it looks like you haven't performed any activity till now. </p>
                                <p> Want to try?</p>
                                <p> Click on the + button given below to track you transaction.</p></div>
                                <g:link controller="wallet" action="index">
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