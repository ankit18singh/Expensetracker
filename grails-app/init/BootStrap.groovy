import com.expensetracker.Profile.Profile
import com.expensetracker.SpringSecurity.SecRole
import com.expensetracker.SpringSecurity.SecUser
import com.expensetracker.SpringSecurity.SecUserSecRole

class BootStrap {

    def init = { servletContext ->
        def userRole = new SecRole(authority : 'ROLE_USER').save(flush: true)

        def testUser = new SecUser(username: 'test@gmail.com', password: 'test').save(flush: true)

        SecUserSecRole.create testUser, userRole

        def currentuser = SecUser.findByUsername('test@gmail.com');
        println currentuser
        def currentuserid = currentuser.id;
        println currentuserid


        Profile testProfile = new Profile(
                fullName: "test",
                userName: "test",
                contactNumber: 999999999,
                gender: Profile.Gender.MALE,
                walletAmount: 2000,
                email: currentuserid
        )

        testProfile.save()
    }
    def destroy = {
    }
}
