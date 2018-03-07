void func(void){char *c = "void func(void){char *c = %c%s%c; printf(c,34,c,34,10);}%c"; printf(c,34,c,34,10);}

/* new comment */
int main(void)
{
	/* Suck this shit bitch */
	func();
	char *c = "%c/* new comment */%cint main(void)%c{%c%c/* Suck this shit bitch */%c%cfunc();%c%cchar *c = %c%s%c;%c%cprintf(c,10,10,10,10,9,10,9,10,9,34,c,34,10,9,10,10);%c}%c";
	printf(c,10,10,10,10,9,10,9,10,9,34,c,34,10,9,10,10);
}
