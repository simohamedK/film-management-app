package com.example.groupe2.readflex.models.entities;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity(name = "Actors")
@AllArgsConstructor
@NoArgsConstructor
public class Actor {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name= "actorName")
    private String actorName;

    @Column(name= "actorImage")
    private String actorImage;


}
