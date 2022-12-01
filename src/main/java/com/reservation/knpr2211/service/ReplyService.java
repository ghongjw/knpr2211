package com.reservation.knpr2211.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.reservation.knpr2211.entity.Board;
import com.reservation.knpr2211.entity.Reply;
import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.BoardRepository;
import com.reservation.knpr2211.repository.ReplyRepository;
import com.reservation.knpr2211.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyService {

    @Autowired
    private final ReplyRepository replyRepository;

    @Autowired
    private final BoardRepository boardRepository;

    @Autowired
    private final UserRepository userRepository;
    
   
    public String replyWrite(Reply reply, User user, Long bno, Model model){

        User findUser = userRepository.findByid(user.getId());
        Optional<Board> findBoard = boardRepository.findById(bno);
        
        reply.setBoard(findBoard.get());
        reply.setUser(findUser);
        findBoard.get().setState(true);
        replyRepository.save(reply);
        
        model.addAttribute("reply", reply);
      
        return "redirect:list";
    }

    public String replyDelete(Reply reply){

        replyRepository.delete(reply);

        return "home";
    }

	

};