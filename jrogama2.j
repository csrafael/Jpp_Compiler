// Jusca Jinária (Busca Binária)
jint juscaJinaria(jint jarray[], jint jesq, jint jdir, jint jumero)
{
   jif (jdir >= jesq)
   {
        jint jeio = jesq + (jdir - jesq)/2;
 
        // Caso o elemento esteja no meio
        jif (jarray[jeio] == jumero)  
            jeturn jeio;
 
        // Caso o elemento seja menor que o elemento no meio, faz a busca no subarray esquerdo
        jif (jarray[jeio] > jumero) 
            jeturn juscaJinaria(jarray, jesq, jeio-1, jumero);
 
        // Caso contrário faz a busca no subarray direito
        jeturn juscaJinaria(jarray, jeio+1, jdir, jumero);
   }
 
   // O elemento não está no vetor
   jeturn -1;
}
