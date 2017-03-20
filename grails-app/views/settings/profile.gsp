<g:applyLayout name="settingsLayout">
    <html>
        <head>
        </head>
        <body>
            <content tag="body">
                <g:if test="${profileDetails}">
                    <div class="container">

                   <h2 class="page-header">Profile</h2>
                        <dl class="dl-horizontal">
                            <dt>Full Name:</dt>
                            <dd>${profileDetails.fullName}</dd>
                            <dt>User Name:</dt>
                            <dd>${profileDetails.userName}</dd>
                            <dt>Gender:</dt>
                            <dd>${profileDetails.gender}</dd>
                            <dt>Email:</dt>
                            <dd>${profileDetails.contactNumber}</dd>
                            <dt>Contact:</dt>
                            <dd>${profileDetails.email.username}</dd>
                            <dt>Wallet Amount</dt>
                            <dd>${profileDetails.walletAmount}</dd>
                        </dl>
                    <g:link controller="settings" action="updateProfile">
                    <i class="fa fa-fw fa-edit fa-3x pull-right"></i>
                    </g:link>

                    </div>

                </g:if>
            </content>
        </body>
    </html>
</g:applyLayout>
