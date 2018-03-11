#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#define N 10
#define SHARP N,35
#define GIVE_BIRTH(x) int main(void) { char *c = "%cinclude <sys/types.h>%c%cinclude <sys/stat.h>%c%cinclude <fcntl.h>%c%cinclude <unistd.h>%c%cinclude <stdio.h>%c%cdefine N 10%c%cdefine SHARP N,35%c%cdefine GIVE_BIRTH(x) int main(void) { char *c = %c%s%c; int f=open(%cGrace_kid.c%c,O_WRONLY|O_CREAT|O_TRUNC,0644); dprintf(f,c,35,SHARP,SHARP,SHARP,SHARP,SHARP,SHARP,SHARP,34,c,34,34,34,10,10,34,34,10);close(f);}%c/* grace will now give birth */%cGIVE_BIRTH(%cchild%c)%c"; int f=open("Grace_kid.c",O_WRONLY|O_CREAT|O_TRUNC,0644); dprintf(f,c,35,SHARP,SHARP,SHARP,SHARP,SHARP,SHARP,SHARP,34,c,34,34,34,10,10,34,34,10);close(f);}
/* grace will now give birth */
GIVE_BIRTH("child")
