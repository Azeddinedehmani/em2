package metier;

import java.sql.*;
import java.util.*;

public class EtudiantImpl {
    public List<Etudiant> getEtudiants() {
        List<Etudiant> etudiants = new ArrayList<>();
        try {
            Connection conn = SingletonConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM etudiant");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Etudiant e = new Etudiant();
                e.setID(rs.getInt("id"));
                e.setNom(rs.getString("nom"));
                e.setPrenom(rs.getString("prenom"));
                e.setEmail(rs.getString("email"));
                e.setFiliere(rs.getString("filiere"));
                etudiants.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return etudiants;
    }

    public Etudiant getEtudiant(int id) {
        try {
            Connection conn = SingletonConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM etudiant WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Etudiant e = new Etudiant();
                e.setID(rs.getInt("id"));
                e.setNom(rs.getString("nom"));
                e.setPrenom(rs.getString("prenom"));
                e.setEmail(rs.getString("email"));
                e.setFiliere(rs.getString("filiere"));
                return e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addEtudiant(String nom, String prenom, String email, String filiere) {
        try {
            Connection conn = SingletonConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO etudiant (nom, prenom, email, filiere) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setString(3, email);
            ps.setString(4, filiere);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void modEtudiant(int id, String nom, String prenom, String email, String filiere) {
        try {
            Connection conn = SingletonConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE etudiant SET nom=?, prenom=?, email=?, filiere=? WHERE id=?"
            );
            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setString(3, email);
            ps.setString(4, filiere);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void supprimerEtudiant(int id) {
        try {
            Connection conn = SingletonConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM etudiant WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Etudiant> rechercherEtudiants(String type, String valeur) {
        List<Etudiant> etudiants = new ArrayList<>();
        try {
            Connection conn = SingletonConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM etudiant WHERE " + type + " LIKE ?"
            );
            ps.setString(1, "%" + valeur + "%");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Etudiant e = new Etudiant();
                e.setID(rs.getInt("id"));
                e.setNom(rs.getString("nom"));
                e.setPrenom(rs.getString("prenom"));
                e.setEmail(rs.getString("email"));
                e.setFiliere(rs.getString("filiere"));
                etudiants.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return etudiants;
    }
}