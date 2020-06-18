package com.clinic.clinic.repository;

import com.clinic.clinic.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    @Query("select u from User u where u.id=?1")
    User findUserById(Long id);
    @Query("select u from User u where u.enabled=0")
    List<User> findAllToApprove();
    @Query("select u from User u where u.salary>0")
    List<User> findAllUser();


}
