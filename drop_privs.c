#define _GNU_SOURCE // Pour utiliser fonction setresuid, il faut ajouter cette entête
#include <unistd.h>
#include <string.h>
#include <stdio.h>
void lowered_privilege_function(unsigned char* ptr){
    char buffer[50];
    setresuid(0,0,0);// lancer comme root pour déboguer
    // ruid, uid réel
    // euid, uid effectif, n'est pas pris en compte que dans l'environnement courant, càd le shell enfant n'a pas cet uid
    //                      aussi, le shell enfant ne peut pas remonter à un privilège supérieur à celui-ci
    // printf("Retour seteuid:%d\n",seteuid(5));
    strcpy(buffer, ptr);
    printf("Euid est:%d\n", geteuid());
}
int main(int argc, char *argv[]){
    if (argc > 0){
        lowered_privilege_function(argv[1]);
        printf("Euid est:%d\n", geteuid());
    }
}
// gcc -g -o drop_privs drop_privs.c -z execstack; sudo chown root ./drop_privs; sudo chmod u+s drop_privs
