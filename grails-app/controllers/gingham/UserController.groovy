package gingham

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController {

    def index() { render 'hello' }

    def add() {
        [roleList: Role.list()]
    }

    def create(String userName, String password, String authority) {
        def user = new User(username: userName, password: password).save(flush: true)
        def role = Role.findByAuthority(authority)

        UserRole.create(user, role)

        redirect action: 'list'
    }

    def delete(String userName) {
        def user = User.findByUsername(userName)
        user.delete(flush: true)

        redirect action: 'list'
    }

    def list() {
        def userList = User.list()

        [userList: userList]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(String username) {
        def user = User.findByUsername(username)
        def pageList = Page.findAllByAuthor(user)
        [user: user, pageList: pageList]
    }
}
