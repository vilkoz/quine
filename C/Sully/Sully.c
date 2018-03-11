#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main(void)
{
	int num = 5;
	char *c = "#include <stdio.h>%c#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <unistd.h>%c%cint main(void)%c{%c	int num = %d;%c	char *c = %c%s%c;%c	char name[128] = {0};%c	snprintf(&(name[0]), 128, %cSully_%cd.c%c, num-1);%c	int fd = open(&(name[0]),O_WRONLY|O_CREAT|O_TRUNC,0644);%c	dprintf(fd, c, 10,10,10,10,10,10,10,10,num-1,10,34,c,34,10,10,34,37,34,10,10,10,10,10,34,37,37,37,34,10,10,34,37,37,34,10,34,34,34,34,10,34,34,10,34,34,10,10);%c	char command[256] = {0};%c	if (num > 0)%c		snprintf(&(command[0]), 256, %cgcc %cs -o Sully_%cd; ./Sully_%cd%c, &(name[0]), num-1,num-1);%c	else%c		snprintf(&(command[0]), 256, %cgcc %cs -o Sully_%cd%c, &(name[0]), num-1);%c	const char *array[4] = {%c/bin/bash%c, %c-c%c, command, NULL};%c	const char *env[2] = {%cPATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin%c, NULL};%c	execve(%c/bin/bash%c, (char*const*)array, (char*const*)env);%c}%c";
	char name[128] = {0};
	snprintf(&(name[0]), 128, "Sully_%d.c", num-1);
	int fd = open(&(name[0]),O_WRONLY|O_CREAT|O_TRUNC,0644);
	dprintf(fd, c, 10,10,10,10,10,10,10,10,num-1,10,34,c,34,10,10,34,37,34,10,10,10,10,10,34,37,37,37,34,10,10,34,37,37,34,10,34,34,34,34,10,34,34,10,34,34,10,10);
	char command[256] = {0};
	if (num > 0)
		snprintf(&(command[0]), 256, "gcc %s -o Sully_%d; ./Sully_%d", &(name[0]), num-1,num-1);
	else
		snprintf(&(command[0]), 256, "gcc %s -o Sully_%d", &(name[0]), num-1);
	const char *array[4] = {"/bin/bash", "-c", command, NULL};
	const char *env[2] = {"PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin", NULL};
	execve("/bin/bash", (char*const*)array, (char*const*)env);
}
