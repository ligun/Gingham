import gingham.*

class BootStrap {

    def init = { servletContext ->
        environments {
            development {
                def md = """\
## Groovy
```
println "hello world!"
```

## Java
```
public class Main {
    public static void main(String... args) {
        System.out.println("hello world!");
    }
}
```

## C
```
#include <stdio.h>

int main(void) {
    printf("hello world!\\n");
    return 0;
}
```
"""
                def user = new User(username: "gingham", password: "gingham").save()
                def adminRole = new Role(name: "管理者",authority: "ROLE_ADMIN").save()

                new Role(name: "一般",authority: "ROLE_USER").save()

                if(!user.authorities.contains(adminRole)) {
                    UserRole.create(user, adminRole)
                }
                new Page(author: user, title: "Hello world", markdown: md).save()


            }
        }
    }
    def destroy = {
    }
}
