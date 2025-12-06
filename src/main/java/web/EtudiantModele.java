package web;

import metier.*;
import java.util.List;

public class EtudiantModele {
    private final EtudiantImpl etudiantImpl;

    public EtudiantModele() {
        this.etudiantImpl = new EtudiantImpl();
    }

    public List<Etudiant> getEtudiants() {
        return etudiantImpl.getEtudiants();
    }

    public Etudiant getEtudiant(int id) {
        return etudiantImpl.getEtudiant(id);
    }

    public void addEtudiant(String nom, String prenom, String email, String filiere) {
        etudiantImpl.addEtudiant(nom, prenom, email, filiere);
    }

    public void modEtudiant(int id, String nom, String prenom, String email, String filiere) {
        etudiantImpl.modEtudiant(id, nom, prenom, email, filiere);
    }

    public void supprimerEtudiant(int id) {
        etudiantImpl.supprimerEtudiant(id);
    }

    public List<Etudiant> getEtudiantsPar(String type, String valeur) {
        return etudiantImpl.rechercherEtudiants(type, valeur);
    }
}
