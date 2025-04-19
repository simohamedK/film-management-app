package com.example.groupe2.readflex.services;

import com.example.groupe2.readflex.models.entities.Story;
import com.example.groupe2.readflex.models.entities.User;
import com.example.groupe2.readflex.repositories.StoryRepository;
import com.example.groupe2.readflex.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    SecurityService securityService;
    @Autowired
    private StoryRepository storyRepository;

    public List<User> getAllUsers(){
        List<User> _users = userRepository.findAll();
        if(!_users.isEmpty()) {
            return _users;
        }
        return null;
    }

    public User getUserById(Long id){
        Optional<User> user = userRepository.findById(id);
        return user.orElse(null);
    }

    public User getUserByEmail(String email){
        if(!email.isBlank()) {
            Optional<User> user = userRepository.findByEmail(email);
            if(user.isPresent()) {
                return user.get();
            }
        }
        return null;
    }

    public User getUserByUsername(String username){
        if(!username.isBlank()) {
            Optional<User> user = userRepository.findByUsername(username);
            if(user.isPresent()) {
                return user.get();
            }
        }
        return null;
    }

    public User saveUser(User user){
        if(user != null) {
            String hashedPassword = securityService.HashPassword (user.getPassword());
            user.setPassword(hashedPassword);
            return userRepository.save(user);
        }
        return null;
    }

    public void deleteUser(Long id){
        if(id != null) {
            Optional<User> _user = userRepository.findById(id);
            if(_user.isPresent()) {
                userRepository.deleteById(id);
            }
        }
    }

    public User updateUser(Long id , User user){
        Optional<User> DataUser = userRepository.findById(id);
        if(DataUser.isPresent()){
            User _user =DataUser.get();
            if(user.getEmail() != null) _user.setEmail(user.getEmail());
            if (user.getUsername() != null) _user.setUsername(user.getUsername());
            _user.setAdmin(user.isAdmin());


            return userRepository.save(_user);
        }
        return null;
    }



    public User change_user_status(long id){
        Optional<User> userData = userRepository.findById(id);
        if(userData.isPresent()){
            User _user = userData.get();
            if (_user.isAdmin()){
                _user.setAdmin(false);
                return userRepository.save(_user);
            }
            else{
                _user.setAdmin(true);
                return userRepository.save(_user);
            }
        }
        return null;
    }

    public boolean authenticateUser(String username, String password){
        Optional<User> userData = userRepository.findByUsername(username);
        if(userData.isPresent()){
            User _user = userData.get();
            return securityService.VerifyPassword(password, _user.getPassword());
        }
        return false;
    }

    public Boolean changePassword(String username,String oldPassword, String newPassword){
        boolean result=false;
        Optional<User> userData = userRepository.findByUsername(username);
        if(userData.isPresent()){
            User _user = userData.get();
            if(securityService.VerifyPassword(oldPassword,_user.getPassword())){
                _user.setPassword(securityService.HashPassword(newPassword));
                userRepository.save(_user);
                result = true;
            }
        }
        return result;
    }

    public void addStoryToFavorites(Long userId, Long storyId) {
        Optional<User> userOpt = userRepository.findById(userId);
        Optional<Story> storyOpt = storyRepository.findById(storyId);

        if (userOpt.isPresent() && storyOpt.isPresent()) {
            User user = userOpt.get();
            Story story = storyOpt.get();

            List<Story> favoriteStories = user.getFavorite_Stories();
            if (!favoriteStories.contains(story)) {
                favoriteStories.add(story);
                user.setFavorite_Stories(favoriteStories);

                userRepository.save(user);
            }
        } else {
            throw new RuntimeException("Utilisateur ou histoire introuvable");
        }
    }
}
