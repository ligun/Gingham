package gingham

class Page {
    String title
    String markdown

    static constraints = {
        title blank: false
        markdown type: 'text'
    }
}
