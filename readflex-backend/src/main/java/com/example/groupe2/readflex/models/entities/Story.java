package com.example.groupe2.readflex.models.entities;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity(name = "Story")
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Story {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name= "storyName")
    private String storyName;

    @Column(name= "storyDescription")
    private String storyDescription;

    @Column(name= "storyImage")
    private String storyImage;

    @Column(name = "storyContent")
    private String storyContent;

    @ManyToOne  // Plusieurs films peuvent appartenir à une catégorie
    @JoinColumn(name = "categorie_id")
    private Categorie categorie;

    @ManyToMany(mappedBy = "Favorite_Stories")  // Un film peut être préféré par plusieurs utilisateurs
    private List<User> users;
}
