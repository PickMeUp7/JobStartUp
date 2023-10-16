package com.pickmeup.jobstartup.seeker.applicationSupport.controller;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.service.UserSecurityService;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.CompanyFollowDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.CompanyFollowServiceImpl;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping ("/seeker")
public class CompanyFollowController {

    @Autowired
    private CompanyFollowServiceImpl companyFollowService;

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    @RequestMapping ("/companyFollowList/{member_no}")
    public String selectCompanyFollowList (@PathVariable int member_no, Model model) {
        List<CompanyFollowDTO> companyFollowResult = companyFollowService.selectCompanyFollowList(member_no);
        model.addAttribute("companyFollowResult", companyFollowResult);
        return "seeker/applicationSupport/companyFollowList";
    }

    //공고 디테일 페이지 열리는 순간 북마크 되어있는지 확인하는 메서드
    @GetMapping("/checkFollow")
    @ResponseBody
    public ResponseEntity<Boolean> checkFollow(@ModelAttribute CompanyFollowDTO companyFollowDTO, Principal principal) {
        Member member = postingBookmarkService.findMemberByUsername(principal.getName());
        companyFollowDTO.setMember_no(member.getMember_no());

        boolean isFollow = companyFollowService.checkFollow(companyFollowDTO);

        return new ResponseEntity<>(isFollow, HttpStatus.OK);
    }

    //북마크 등록/해제
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/companyFollow")
    @ResponseBody
    public ResponseEntity<String> companyFollow(@RequestParam boolean isFollow,
                                                     @RequestParam int company_no,
                                                     @RequestParam int member_no) {
        CompanyFollowDTO follow = null;
        // 북마크 추가 로직
        follow = CompanyFollowDTO.builder()
                .company_no(company_no)
                .member_no(member_no)
                .build();
        if (!isFollow) {


            companyFollowService.insertFollow(follow);

            // DB에 값 insert
            return ResponseEntity.ok("inserted");
        } else {
            // 북마크 삭제 로직
            companyFollowService.deleteFollow(follow);

            // DB에서 값 delete
            return ResponseEntity.ok("deleted");
        }

    }
}
