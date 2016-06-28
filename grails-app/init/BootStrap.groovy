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
                new Page(title: "Hello world", markdown: md).save()

            }
        }
    }
    def destroy = {
    }
}
