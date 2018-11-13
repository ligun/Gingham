package gingham

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "page", action: "index")
        "/user/show/$username"(controller: "user", action: "show")
        "/picture/download/$fileName"(controller: "picture", action: "download")
        "/picture/delete/$fileName"(controller: "picture", action: "delete")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
