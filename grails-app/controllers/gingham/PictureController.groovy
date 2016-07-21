package gingham

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class PictureController {

    def index() { redirect action: "download" }

    def upload() {
        Picture picture = new Picture(fileName: params.fileName,fileData: params.fileData)
        if(!picture.save(flush: true)) {
            def error = [error: [message: "upload failed"]]
                render error as JSON
                return
        }
        def url = [url: createLink(action: "download", id: picture.fileName, absolute: true)]
        render url as JSON
    }

    def download(String fileName) {
        Picture picture = Picture.findByFileName(fileName)
        if(picture == null) {  //画像がなければNotFound
            response.sendError(404)
            return
        }

        response.outputStream << picture.fileData
    }

    def list() {
        [pictureList: Picture.list()]
    }

    def delete(String fileName) {
        Picture picture = Picture.findByFileName fileName
        if(picture != null) {
            picture.delete(flush: true)
        }
        redirect action: "list"
    }
}
