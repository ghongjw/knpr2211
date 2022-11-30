package com.reservation.knpr2211.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public String replyWrite(Reply reply, User user, Long bno){

        User findUser = userRepository.findByid(user.getId());
        Optional<Board> findBoard = boardRepository.findById(bno);

        reply.setBoard(findBoard.get());
        reply.setUser(findUser);
        replyRepository.save(reply);

        return "board/list";
    }

    public String replyDelete(Reply reply){

        replyRepository.delete(reply);

        return "board/list";
    }
};