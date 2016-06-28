package gingham
import io.github.gitbucket.markedj.*

class PageController {
    def index() {
        [pageList: Page.list()]
    }

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
