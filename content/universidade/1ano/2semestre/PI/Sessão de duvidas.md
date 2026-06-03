```c
int match(char a, char b){
	return ((a == '(' && b == ')') || 
			(a == '[' && b == ']') || 
			(a == '{' && b == '}'))
}

int parentesisOk(char * e){
	int r; int i;
	char st[strlen(e)]; int sp = 0;
	for(i = 0; e[i] ! = '\0'; i++){
		if(e[i] == '('|| e[i] == '[' || e[i] == '{') st[sp ++] = e[i]; 
		else if(e[i] == ')' || e[i] == ']' || e[i] == '}')
			 if(sp > 0 && match (e[i], st[sp-1])) sp --;
			 else return 0;
	}	
	return(sp == 0);  
}
```

```c 
int dist(ABin a, int x){
	int r = 0;
	while(x != a->valor){
		r++;
		if(x > a->valor) a = a->dir;
		else a = a-> est;
	}
	return r;
}

int parentesco(ABin a, int x, int y){
	while(1){
		if( x > a->valor && y > valor) a = a->dir;
		else if(a < a->valor && y < a->valor) a = a->esq
		else return(dist(a, x) + dist(a, y))
	}
}
```
