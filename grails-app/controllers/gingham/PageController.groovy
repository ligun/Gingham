package gingham
import io.github.gitbucket.markedj.*
import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class PageController {
    def springSecurityService

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index() {
        [pageList: Page.list()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Page page) {
        def html = Marked.marked(page.markdown)
        [id: page.id, page: page, html: html]
    }

    def edit(Page page) {
        [page: page]
    }

    def save(Page page) {
        if(page.id != null) {
            def oldPage = Page.findById(page.id)
            if(oldPage.author != springSecurityService.currentUser) {
                render view: "/login/denied"
                return
            }
        }else {
            page.author = springSecurityService.currentUser
        }
        page.save()
        redirect action: "show", id: page.id
    }
}
