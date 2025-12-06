// 1. Classe Etudiant.java
package metier;

public class Etudiant {
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String filiere;

    public Etudiant() {}

    public Etudiant(int id, String nom, String prenom, String email, String filiere) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.filiere = filiere;
    }

    // Getters
    public int getID() { return id; }
    public String getNom() { return nom; }
    public String getPrenom() { return prenom; }
    public String getEmail() { return email; }
    public String getFiliere() { return filiere; }

    // Setters
    public void setID(int id) { this.id = id; }
    public void setNom(String nom) { this.nom = nom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
    public void setEmail(String email) { this.email = email; }
    public void setFiliere(String filiere) { this.filiere = filiere; }
}
