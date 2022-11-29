package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.reservation.knpr2211.entity.Reply;
import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.service.ReplyService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReplyController {

    @Autowired
    private final ReplyService replyService;

    @PostMapping("/reply_write")
    public String replyWrite(@ModelAttribute Reply reply, Long bno,
            User user){

        return replyService.replyWrite(reply, user, bno);

    }

    @PostMapping("/reply_delete")
    public String replyDelete(@ModelAttribute Reply reply, 
            User user){


        return replyService.replyDelete(reply);
    }

};
