package com.example.groupe2.readflex.models.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "username",unique = true, nullable = false)
    private String username;
    @Column(name = "email" , unique = true, nullable = false)
    private String email;
    @Column(name = "password", nullable = false)
    private String password;
    @Column(name = "isAdmin", nullable = false, columnDefinition = "boolean default false")
    private boolean isAdmin;

    @ManyToMany
    @JoinTable(
            name = "user_story_favorite",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "story_id"))
    List<Story> Favorite_Stories;


    public User() {}
    public User(String username, String email, String password, boolean isAdmin) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
    }


    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean status) {
        isAdmin = status;
    }


}
