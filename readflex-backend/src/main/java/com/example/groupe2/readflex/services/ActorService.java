package com.example.groupe2.readflex.services;

import com.example.groupe2.readflex.models.entities.Actor;
import com.example.groupe2.readflex.repositories.ActorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class ActorService {

    @Autowired
    private ActorRepository actorRepository;

    public List<Actor> getAllActors() {
        return actorRepository.findAll();
    }

    public Optional<Actor> findActorById(long id) {
        return actorRepository.findById(id);
    }

    public void deleteActor(long id) {
        actorRepository.deleteById(id);
    }

    public Actor createActor(Actor actor) {
        return actorRepository.save(actor);
    }

    public Actor updateActor(long id, Actor actor) {
        Optional<Actor> dataActor = actorRepository.findById(id);

        if (dataActor.isPresent()) {
            Actor _actor = dataActor.get();
            if (!Objects.equals(actor.getActorName(), _actor.getActorName())) _actor.setActorName(actor.getActorName());
            if (!Objects.equals(actor.getActorImage(), _actor.getActorImage()))
                _actor.setActorImage(actor.getActorImage());
            return actorRepository.save(_actor);
        }
        return null;
    }
}
