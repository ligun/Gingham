package gingham
import io.github.gitbucket.markedj.*
import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class PageController {
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index() {
        [pageList: Page.list()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Page page) {
        def html = Marked.marked(page.markdown)
        [id: page.id, title: page.title, html: html]
    }

    def edit(Page page) {
        [page: page]
    }

    def save(Page page) {
        page.save()
        redirect action: "show", id: page.id
    }
}
