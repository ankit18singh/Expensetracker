<g:applyLayout name="mainLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <div class="row">
                    <div class="col-sm-12">
                       <div class="jumbotron">
                        <h2 class="page-header">Timeline</h2>
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
                                                        <h5 class="handle">${it.author}</h5>
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
                                                        <span class="mdl-chip__text">${it.transactionAmount}</span>
                                                    </span></h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </g:each>
                       </div>
                    </div>
                </div>
            </content>
        </body>
    </html>
</g:applyLayout>