package gingham

class Page {
    User author
    String title
    String markdown

    static constraints = {
        title blank: false
        markdown type: 'text'
    }
}
