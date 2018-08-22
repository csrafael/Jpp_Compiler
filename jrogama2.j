// Jusca Jinária (Busca Binária) 
jint jbuscaJbinaria(jint jarray[], jint jesq, jint jdir, jint jnumero)
{
   jif (jdir >= jesq)
   {
        jint jeio = jesq + (jdir - jesq)/2;
 
        // Caso o elemento esteja no meio 
        jif (jarray[jmeio] == jumero){  
            jreturn jmeio;
	}
 
        // Caso o elemento seja menor que o elemento no meio, faz a busca no subarray esquerdo 
        jif (jarray[jmeio] > jnumero) 
            jreturn jbuscaJbinaria(jarray, jesq, jmeio-1, jnumero);
 
        // Caso contrário faz a busca no subarray direito

        jreturn jbuscaJbinaria(jarray, jmeio+1, jdir, jnumero);
   }
 
   // O elemento não está no vetor
   jreturn -1;
}

jint jmain(){
    jint ja[5] = {1,2,3,4,5};
    int jb = jbuscaJbinaria (ja,0,4,3);
}

jend
